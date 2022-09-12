defmodule Allris do
  @districts ~w(altona eimsbuettel hamburg-mitte hamburg-nord wandsbek bergedorf harburg)

  def districts, do: @districts

  def url(district, type, id)

  def url(district, "VOLFDNR", id) when district in @districts do
    "https://sitzungsdienst-#{district}.hamburg.de/bi/vo020.asp?VOLFDNR=#{id}"
  end

  def url(district, "TOLFDNR", id) when district in @districts do
    "https://sitzungsdienst-#{district}.hamburg.de/bi/to020.asp?TOLFDNR=#{id}"
  end

  def url_bv_hh(district, type, id)

  def url_bv_hh(district, "VOLFDNR", id) when district in @districts do
    "https://bv-hh.de/#{district}/documents/allris?allris_id=#{id}"
  end

  def url_bv_hh(district, "SILFDNR", id) when district in @districts do
    "https://bv-hh.de/#{district}/meetings/allris?allris_id=#{id}"
  end

  def url_bv_hh(district, _type, _id) when district in @districts do
    nil
  end

  def url_bv_hh(%{"district" => d, "type" => t, "id" => i}), do: url_bv_hh(d, t, i)

  @spec convert_url_to_bvhh(binary) :: binary() | nil
  def convert_url_to_bvhh(url) do
    match =
      Regex.named_captures(
        ~r|^https://sitzungsdienst-*(?<district>[^.]+).hamburg.de/bi/.*?\?(?<type>[A-Z]+)=(?<id>\d+)$|,
        url
      )

    if match, do: url_bv_hh(match)
  end
end
