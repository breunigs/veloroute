defmodule Data.Article.Blog.BinnenhafenHarburg do
  use Article.Default

  def name(), do: "#{created_at()}-10-binnenhafen-harburg"
  def created_at(), do: ~D[2019-01-08]

  def title(), do: "Binnenhafen Harburg (Veloroute 10)"

  def start(), do: ~d[2021-02-15]
  def stop(), do: ~d[2022-08-11]

  def type(), do: :construction
  def construction_site_id_hh(), do: [14569, 17416, 17425, 20204]
  def tags(), do: ["10", "H01"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Radverkehrsanlagen sind auf der <.m bounds="9.990524,53.465614,9.993981,53.470227">Nartenstraße</.m> gar nicht vorhanden, auf dem <.m bounds="9.985072,53.465773,9.990524,53.466389">Veritaskai</.m> nur teilweise und in der <.m bounds="9.981094,53.46289,9.985151,53.468067">Harburger Schloßstraße</.m> zwar durchgängig, aber viel zu schmal. An den Abbiegesituationen wurde jeweils der Radverkehr ignoriert, entsprechend abendteuerlich verhält sich die Querung. Langfristig sieht die Planung vor, das Über- bzw. Unterqueren der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.465313, lon: 9.976338, zoom: 16}))}>B37 Buxtehuder Straße</.m> zu vermeiden, weswegen die Planung den Ausbau der künftigten Route über den <.m bounds="9.981556,53.466307,9.98602,53.467214">Kanalplatz</.m> und die <.m bounds="9.979395,53.464805,9.982514,53.467981">Blohmstraße</.m> vorsieht. Im weiteren Verlauf würde dann die Bahnstrecke gequert und direkt an den <.m bounds="9.937452,53.469337,9.97079,53.476242">Bostelbeker Hauptdeich</.m> angeschlossen, was aber nicht Bestandteil dieser Planung ist.</p> <p>Die Kernpunkte dieses ersten Entwurfs sehen einen westlichen bzw. nördlichen Zweirichtungsradweg vor, der je nach Platzangbot 3,0m bis 4,0m Breite aufweist. An der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.465996, lon: 9.991091, zoom: 18}))}>Kreuzung mit der Neuländer Straße</.m> ist ein Kreisel geplant, wobei der <.m bounds="9.990516,53.465827,9.990924,53.467492">Treidelweg</.m> jedoch vor dem Kreisel in die Nartenstraße münden soll. Der Radweg wird im Norden am Kreisel vorbeigeführt. Um in die in den <.m bounds="9.985072,53.465773,9.990524,53.466389">Veritaskai</.m> einmündenden Straßen abbiegen zu können, ist vorgesehen den Radweg hier jeweils über große Längen bis an die Straße zu erweitern, quasi um eine „Abbiegespur“ zu erhalten. Das eigentliche Queren der Fahrbahn erfolgt ungeregelt, wobei manchmal eine Mittelinsel bzw. Aufstellfläche zwischen den KFZ-Spuren zur Verfügung steht.</p> <p>Als Vorteile des Zweirichtungsradweges werden die einheitliche Führung im Vor- und Nachgang des Planungsabschnitts, die höhere Qualität für Radfahrende (etwa durch leichteres Überholen), das hohe subjektive Sicherheitsgefühl und der Reisezeitgewinn durch die Entkopplung vom KFZ Verkehr genannt.</p> <p>Bei der Abgrenzung des Radweges zur Fahrbahn um zum Gehweg ist jeweils ein 6cm hoher Bordstein vorgesehen, was sich am Kopenhagener Modell orientiert. An den Einfahrten die den Radweg kreuzen ist jeweils ein „<.a href="https://de.wikipedia.org/wiki/Datei:Zeichen_205_-_Vorfahrt_gew%C3%A4hren!_StVO_1970.svg">Vorfahrt gewähren</.a>“ mit „<.a href="https://de.wikipedia.org/wiki/Datei:Zusatzzeichen_1000-32_-_Radfahrer_kreuzen_von_rechts_und_links,_StVO_1997.svg">Radverkehr in beiden Richtungen</.a>“ Schild vorgesehen, zusätzlich zu Fahrradpiktogrammen im Bereich der Überfahrt. Auf dem Radweg sollen entsprechend davor und danach „gestaffelte Dickschichtmarkierungen“ aufgetragen werden, die dem Radverkehr eine Geschwindigkeitsreduktion nahelegen. Gemeint sind Querlinien, ähnlich einer Haltelinie, deren Abstände zur Gefahrenstelle immer geringer werden. Ebenfalls werden für den kreuzenden KFZ-Verkehr spezielle Randsteine verlegt, die die Geschwindigkeit beim Überfahren weiter verringern sollen.</p> <p>Ich kann mich mit der Planung nicht anfreunden. Zwar ist es löblich, das über Radschnellwege nachgedacht wird, aber wenn dies in einem Innenstadtbereich mit zig Überfahrten passiert ist nicht nur die Gefahrenlage für den Radverkehr inakzeptabel, es kann auch nicht mehr von „Schnellweg“ gesprochen werden. So befinden sich auf dem rund 1,7km langen Planungsabschnitt 17 Überfahrten und entsprechend je zwei Mal 17 „gestaffelte Dickschichtmarkierungen“. Im Schnitt also kommt also alle 100m eine solche Gefahrenstelle. Die Streifen sollen eigentlich Aufmerksamkeit beim Radfahrenden hervorrufen, dürften bei dieser Anzahl aber vor allem als nervige Rüttelstreifen wahrgenommen werden. Weiterhin ist es nicht verboten links in die Grundstücke einzubiegen. Damit sind insgesamt fünf potentielle Konflikte gleichzeitig zu beachten: Rad- und Fußverkehr aus zwei Richtungen sowie der entgegenkommende KFZ-Verkehr. Da der Schulterblick auch in einfacheren Situationen häufig nicht angewandt wird, ist also mit regelmäßigen „beinahe“ Situationen zu rechnen. Wie ein subtil schwerer zu überfahrender Randstein in Zeiten der SUV-Schwemme helfen soll, wird nicht erklärt.</p> <p>Außerdem ist davon auszugehen, das ausfahrende Autos auf dem Radweg zum Halten kommen, etwa aus Unachtsamkeit, Gleichgültigkeit oder weil eine Lücke falsch eingeschätzt wurde. Der 4,0m breite Radweg erleichtert dies sogar, denn der Radverkehr kann hinter dem KFZ ausweichen. Durch die häufig hohen KFZ ist aber keine gute Sicht auf den entgegenkommenden Verkehr gegeben, was die Geschwindigkeit dämpft und die Gefahr von abbiegenden KFZ übersehen zu werden erhöht.</p> <p>Aus meiner Sicht sind die Schutzmaßnahmen, v.a. für Radfahrende in „Gegenrichtung“, nicht hinreichend. Das der Bericht „erwartet, dass sich die Gefahrenlage durch […] Assistenzsysteme und der Automatisierung des MIV minimiert“ ist zynisch, insbesondere da weniger gefährliche Radfahrstreifen in ordentlicher Breite fast durchgängig problemlos möglich wären. Des weiteren sind die Querungstellen unübersichtlich und erfordern eine genaue Kenntniss der Lage um sicher benutzt werden zu können. So findet sich beispielsweise direkt eine Bushaltestelle im Bereich der Einmündung der <.m bounds="9.986932,53.461677,9.98861,53.465877">Theodor-Yorck-Straße</.m>. KFZ die gerade aus möchten, müssen hinter dem Bus warten – es sei denn sie kürzen über die Linksabbiegerspur ab. Dies kann ein vor dem Bus querender Radfahrender aber nicht sehen. Es findet sich auch kein Konzept wie verhindert werden soll, das die 2,0m breite „Abbiegespur“ auf dem Radweg als Parkplatz missbraucht wird. Das der Zweirichtungsradweg gerade für lokale Radfahrten nicht besonders geeignet ist merken die Planer selbst: so ist von der <.m bounds="9.986932,53.461677,9.98861,53.465877">Theodor-Yorck-Straße</.m> bis zum <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.465996, lon: 9.991091, zoom: 18}))}>Kreisel an der Neuländer Straße</.m> ein zusätzlicher Schutzstreifen eingeplant. Möchte man aus dem Kreisel auf den Zweirichtungsradweg auffahren, muss man die Aufführung im Bereich der Einfahrt(!) der Nartenstraße nutzen. Wartende KFZ sind hier also nicht nur ein Sichthindernis, sondern stehen im Normalfall in der Ideallinie. Möchte man gar Richtung <.m bounds="9.985072,53.465773,9.990524,53.466389">Veritaskai</.m> weiterfahren, kommt zudem ein spitzer Winkel beim Linkssabiegen von der Auffahrt auf den Radweg hinzu.</p> <p>Unterm Strich wirkt die Planung also sowohl im Groben durch den gefährlichen linksseitigen Radweg als auch im Detail durch unklare Abbiegebeziehungen unausgegoren. Da es sich um einen ersten Entwurf handelt, ist zu hoffen das noch stark überarbeitet wird. Gebaut werden soll vorraussichtlich ab 2019.</p> <p><.a href="https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005979">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)<br><.a href="https://www.hamburg.de/harburg/pressemeldungen/15450444/ausbau-veloroute-10/">Infoseite der Stadt mit Baustelleninfo</.a></p>
    """
  end
end
