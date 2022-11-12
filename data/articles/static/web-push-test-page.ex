defmodule Data.Article.Static.WebPushTestPage do
  use Article.Static

  def title(), do: "Web Push Test Page"

  def tags(), do: []

  def text(assigns) do
    assigns = assign(assigns, :self_url, Article.Decorators.url(__MODULE__))

    ~H"""
    <h3 id="getNotified">Web Push Test Page</h3>
    <p>Experimentelles Feature um bei neuen Artikeln Push Nachrichten auf das Gerät zu schicken. Probleme oder Fehler bitte an <.mailto/> melden.</p>
    <.live_component module={VelorouteWeb.Live.Push} id="push-notifications" self_url={@self_url}/>
    """
  end
end
