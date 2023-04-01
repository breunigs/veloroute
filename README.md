## Using this project

Setting up this project requires an IT background. There is also no graphical
interface to edit the website – essentially you will write articles and
cut/combine videos in a text editor using a very technical format (a combination
of programming and markup language). So even "just" editing the contents of the
site currently requires IT experience. Long story short, it's not usable by end
users, at least not yet.

## Repository contents

This repository currently contains both of:
- project independent code and tooling
- articles, data and other project specific things for
  [veloroute.hamburg](https://veloroute.hamburg)

With reasonable effort it should be possible to completely split the two. Please
[create an issue](https://github.com/breunigs/veloroute/issues) if you want to
use the technology for an independent project and we can work out the technical
details. As long as there is only une user (= veloroute.hamburg), I intend to
keep everything in a single repository for convenience and efficiency reasons.

## What's included?

The project mostly uses open source software to provide its functionality. There
are notable exceptions:
- video stabilization needs to happen on the camera, there is no tooling included
  to "deshake" videos.
- the search results for streets, points of interest, etc. are provided through
  [ESRI](https://www.esri.com/en-us/home) and
  [Maptiler](https://www.maptiler.com/).
- Satellite imagery is also provided through either of these two companies,
  although a reverse proxy is used to conserve privacy.
- display of street polyline (e.g. when clicking a search result) requires
  external tooling to provide OpenStreetMap extracts. This is currently provided
  by [Geofabrik GmbH](https://www.geofabrik.de/) as a service to the
  OpenStreetMap community, on which this project piggy backs. The additional
  processing necessary to integrate this data is done from within the project,
  though.
- the machine learning model used to detect license plates and faces is not
  included. I can upload mine if desired, it's around 1.5 GB.

The website is written in [Elixir](https://elixir-lang.org/), using the [Phoenix
Framework](https://www.phoenixframework.org/) and [Live
View](https://github.com/phoenixframework/phoenix_live_view) to provide the
frontend to the end users. The interactive parts that need to happen in the
browser are written in JavaScript. Styling uses
[SCSS](https://sass-lang.com/documentation/syntax), a super-set of regular CSS.

You will need to setup a reverse proxy for encryption (TLS/SSL) and more
efficient video streaming. If you don't have one yet,
[Caddy](https://caddyserver.com/) is a good choice.

The tooling meant to be used by the developer is also written in Elixir. It will
run more complex tasks in containers to ease the effort of setting up the
development dependencies. The most important ones are:
- [yolov5](https://github.com/ultralytics/yolov5) for license plate and face
  detection. Requires a pre-trained model, which is not shipped in this
  repository (see above).
- [ffmpeg](https://ffmpeg.org/) with suitable libraries to blur the license
  plates and faces as well as render the videos in a format suitable for
  streaming.


## Cost and hardware considerations

### Personal effort

Obviously you will have to spend your time on setting up this project and
learning how to use it. In it's current state it is also not very polished for
new users, so you will require a high frustration tolerance.

### Development computer

You'll also need a laptop or desktop computer running a unix-like operating
system for developing. It has only been tested on Debian/Linux. For basic usage,
pretty much any machine will do.

However, especially face and license plate detection benefits heavily from a
dedicated graphics cards. Any used card that supports
[CUDA](https://en.wikipedia.org/wiki/CUDA) is probably good enough. Since the
video encoders used are not able to take advantage of the graphics card, the
difference is less pronounced:

|               | 2018 notebook | 2014 gaming PC |
|---------------|---------------|----------------|
| **detection** |               |                |
| one frame     | 7 seconds     | 0.2 seconds    |
| 10min @ 25fps | 29 hours      | 55 minutes     |
| **rendering** |               |                |
| one frame     | 2 seconds     | 1.5 seconds    |
| 10min @ 25fps | 8.5 hours     | 6.25 hours     |

If you want to train your own machine learning model for detection, you will
need a very high-end graphics card. The ones with enough memory to allow
training at a high resolution are very expensive, and you don't need them for a
long time. I recommend to rent these in the cloud (good search term: "rent gpu
machine learning", there's lots of competition in this space).

### Video camera

In principle you can use any camera for the purpose. However, specialized action
cameras usually beat even high end cell phone cameras while still being easily
mountable on a bicycle or dashboard.

Built-in image stabilization is usually a must. Action cameras from 2021 and
later have decent ones built in; or you can re-use other stabilizing equipment
like a gimbal. The more the action camera does on its own, the more convenient
it will be to setup. If you want horizon leveling (picture doesn't tilt when you
lean into bend with a bike) look at the maximum angle with the recording mode
you want to use. There are sometimes surprising limitations where you can only
have horizon leveling with a very narrow picture, for example.

On camera time-lapse is also nice to have. It's possible to achieve this in
software, but the results are not as good and you have to spend additional
processing time.

In general, you get what you pay for in this market. Cheap action cameras will
result in bad picture quality, while the high-end ones give you good quality. If
you are on a budget, rather buy a high-end used one than an cheap knock-off one.

### Navigation / Routing

Either know the path you want to film by heart, or setup some kind of routing
through your cellphone or more specialized device. Any mistake will cost you
time down the line and the resulting video is also less pleasant to watch:
- finding the timestamps where to cut/join videos is effortful
- camera position jumps or angle changes can be disorienting, so videos should
  be joined when they are at the _exact_ same position.

Let's look at an example: the route you want to film goes straight, but you
accidentally make a right turn. In everyday life you could just make a u-turn to
get back to the intersection and make a right there to get to the intended route
again. When you later try to put these videos together, essentially the whole
intersection will be missing because you lack the "straight through the
intersection" segment.

### Hosting costs

The website compiles down to some shell scripts and binaries. That means a
simple file hosting is not enough and you need at least some possibility to run
arbitrary executables. There are few requirements beyond that, i.e. there are no
particular performance considerations. That means that even the cheapest VPS
hosters will work.

10 minutes of rendered video need roughly 2.8 GB of storage with the default
quality levels and fallbacks when there are video playback issues. If the video
codecs and browser video support improves, this number might go down in the
future.

## Installation

This will install all the software you need to run the development version on
your machine. You can also build releases and deploy them via SSH with this.

Below are installation instructions for Debian and its derivates. You'll need
Elixir 1.13+. The repository contains a `.tool-versions` that compatible version
managers like [asdf](https://asdf-vm.com/) can use to install the right versions
for you.

```bash
# standard tooling
sudo apt-get install build-essential docker.io git inotify-tools josm nodejs npm unzip

# give yourself access to Docker (needs re-login usually)
sudo usermod -a -G docker $(whoami)

# (A) Elixir/Erlang from distribution
sudo apt-get install elixir erlang-dev erlang-xmerl
# (B) …or via asdf or similar package managers
sudo apt-get install autoconf automake libssl-dev libncurses5-dev
asdf plugin add erlang
asdf plugin add elixir
asdf install

# install Erlang/Elixir package management dependencies
mix local.hex --force
mix local.rebar --force

# project itself
git clone https://github.com/breunigs/veloroute/
cd veloroute
mix deps.get
npm install --prefix ./assets
```

You'll need to a place to store your videos, both your private originals and the
processed versions that get served on site. Due to their size, they are not
hosted within the git repository and are not included when building the release.
Instead, symlink them:

```bash
cd veloroute
ln -s /path/to/your/video/storage videos/
```

Next, create a [Mapbox.com](https://account.mapbox.com/) account, which is used
for storing and rendering the map shown to the user. Once you have created an
account there, you'll need two tokens:
- a public one, starting with `pk.` for showing the map to the users
- a secret one, starting with `sk.` for updating the map on changes

```bash
mix velo.setup
```

After this, you should be able to run the development server and look at the
website using `mix phx.server`, or build a complete release using `mix deploy`.
