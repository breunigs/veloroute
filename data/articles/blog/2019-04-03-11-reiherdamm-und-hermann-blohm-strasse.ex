defmodule Data.Article.Blog.ReiherdammUndHermannBlohmStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-11-reiherdamm-und-hermann-blohm-strasse"
  def created_at(), do: ~D[2019-04-03]
  def updated_at(), do: ~D[2020-03-11]
  def title(), do: "Reiherdamm und Hermann-Blohm-Straße (Hafen, Veloroute 11)"

  def start(), do: ~d[2019-05-13]
  def stop(), do: ~d[2021Q3]

  def type(), do: :finished

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Stand März 2020: Die genauen Planungsunterlagen sind mittlerweile bekannt geworden. Der Artikel wurde entsprechend konkretisiert.</p>
    <p>Im Hafen werden sowohl die <.m bounds="9.96234,53.536763,9.970476,53.541609">Hermann-Blohm-Straße</.m> als auch der <.m bounds="9.960408,53.526768,9.978972,53.537824">Reiherdamm</.m> umgebaut. Bisher lenkte die Radführung auf den Fußweg, der auch noch in beide Richtungen befahren werden sollte. Radfahrende Richtung Süden sollten also linksseitig entgegen der normalen Verkehrsrichtung auch den Fußweg nutzen.</p>
    <p>Nach dem Umbau wird es auf beiden Seiten Radfahrstreifen geben, die nur im Bereich der Bushaltestellen unterbrochen werden. Die einzige Abtrennung vom KFZ und LKW Verkehr ist eine 25cm breite weiße Linie („Breitstrich“ in der Fachsprache). Wo bisher Fußwege vorhanden waren, bleiben sie auch nach dem Umbau – allerdings teilweise deutlich schmäler als bisher.</p>
    <p>Vom <.m bounds="9.962343,53.538197,9.971247,53.543499">Alten Elbtunnel</.m> aus gesehen sind die Radfahrstreifen mit 2,0m noch brauchbar breit. Bereits ab der <.m bounds="9.962343,53.538197,9.971247,53.543499">Bushaltestelle Finkenwerder (Fähre)</.m>, stehen mit 1,60m jedoch nur die absoluten Mindestbreiten zur Verfügung. Der Zebrastreifen an dieser Stelle bleibt, wird jedoch um eine 2,50m breite Mittelinsel ergänzt.</p>
    <p>Um die <.m bounds="9.964624,53.536232,9.969014,53.538846">Haltestelle Norderloch</.m> herum wird das bisherige halbseitig auf dem Fußweg Parken durch bauliche Längsparkplätze ersetzt. Auch deswegen bleiben die Radfahrstreifen hier bei ihren je 1,60m Breite. Um Dooringunfällen vorzubeugen sind 50cm Sicherheitsabstand zu den vorgesehen.</p>
    <p>Ab dem <.m bounds="9.965989,53.535639,9.970379,53.538253">Reiherdamm</.m> weiten sich die Spuren wieder auf 2,0m auf. Bis auf eine kleinere Engstelle auf der <.m bounds="9.965536,53.531057,9.971876,53.534833">Brücke über den Grevenhofkanal</.m> bleibt das bis zur <.m bounds="9.96374,53.527555,9.975328,53.534455">Einmündung Nehlsstraße</.m> auch so. Ab hier gibt es bis zur Kreuzung an der Argentinienbrücke wieder nur 1,60m Mindestmaße.</p>
    <p>Die <.m bounds="9.970682,53.526869,9.975292,53.529613">Kreuzung an der Argentinienbrücke</.m> ist nicht mehr Teil dieses Ausbauabschnitts. Es gibt deswege nur geringe Anpassungen um die neuen Radfahrstreifen anzuschließen. Stadteinwärts wird der Gehweg zu einem kombinierten Rad/Gehweg (bisher: Gehweg mit „Fahrrad frei“) und auf der Südseite wird ein roter Radfahrstreifen über die Kreuzung markiert. Der Rechtsabbieger in die Buchheisterstraße bleibt unverändert und der Radverkehr wird so nicht durch die Ampel geschützt. Die Ampelfurten für Fuß/Rad werden jeweils in beide Richtungen freigegeben, sodass eher die Chance besteht stadtauswärts an nur einer Ampel warten zu müssen.</p>
    <p>Der Umbau hatte Mitte 2019 im <.m bounds="9.960408,53.526768,9.978972,53.537824">Reiherdamm</.m> begonnen. Im direkten Anschluss soll bis 2021 die <.m bounds="9.96234,53.536763,9.970476,53.541609">Hermann-Blohm-Straße</.m> folgen. Während der Bauzeit soll der Radverkehr vorerst weiter den Gehweg nutzen.</p>
    <p>Positiv am Umbau ist das Rad- und Fußverkehr getrennt voneinander geführt werden und es so weniger Konflikte geben sollte, gerade im Bereich der Bushalte. Das die Radfahrstreifen über lange Strecken mit nur 1,60m ausgeführt werden ist jedoch als unbrauchbar einzustufen. Offensichtlich hat man dem Sicherheitsgefühl vieler Radfahrenden hier keine Beachtung geschenkt.</p>
    <p><.a href="https://fragdenstaat.de/anfrage/planunterlagen-zu-hermann-blohm-strae-reiherdam-o-0975-18-o-eu/#nachricht-469518">Ausschreibung und Planungsunterlagen zum Umbau</.a> (Karten ab Seite 396).</p>
    """
  end
end
