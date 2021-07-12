# defmodule Data.Route.Route1 do
#   use Route.Parser,
#     yaml: """
#     1 (stadteinwärts von Rissen):
#     - { seq: "5IqlKcFs0KI0hzf95q5ujg", from: "lTpWipm58HY42iLi2j3nFg", to: "dipnyDUsoohZHyCAkHv3yg" }
#     - { seq: "r5BxwlZXPLNVGg8UY99Cog", from: "4BerYmgIggIr3PZJyyw4jw", to: "PPGpU26TYNORCgKpLqxg0A" }
#     - { seq: "r5BxwlZXPLNVGg8UY99Cog", from: "H7kCeHO24ILyd9PSuv4FlQ", to: "ARtwesfurI2g-b6DODitUA" }
#     - { seq: "Za0iX469_F-8Oz0VVXdQZg", from: "ZvCv2Holgd6qpi2xyBFUuQ", to: "DNBa_59aJiHh9DEoUrbGIw" }
#     - { seq: "Za0iX469_F-8Oz0VVXdQZg", from: "uQGl3GDbJ6ou3aDWf6mrsg", to: "EwEtYcK1dKm_i_r8FTHarQ" }
#     - { seq: "Za0iX469_F-8Oz0VVXdQZg", from: "Z973zBJYsIMsS26hGJtzyw", to: "vfSwcgKyTPzdOHgzqwD-Fw" }
#     - { seq: "rrYd6g5lm-kicLyce8fYJQ", from: "OJyAJE5ejQHWWEXYRHiufA", to: "_LzlR5DzYeagbckFKT-aQQ" }
#     - { seq: "rrYd6g5lm-kicLyce8fYJQ", from: "c2VnvikuUMqnYLbM80N1Xw", to: "E6eriw_6-HiVn37LoZxQSw" }
#     - { seq: "rrYd6g5lm-kicLyce8fYJQ", from: "c2VnvikuUMqnYLbM80N1Xw", to: "XNOmQ970uZl5egMB1C1WuA" }
#     - { seq: "mEGl22xVXzjEyr31HcdCuw", from: "1L0rCkn207a7DpwfiUH39g", to: "ho_IvyO0fjHwSbWA5aJBtg" }
#     - { seq: "JrwSDcWMbqStLYpZi1V6sQ", from: "lXVHNLck--MewkQVyyg32g", to: "JGY9x_Fr0VAdkTgPXDUfIg" }
#     - { seq: "JrwSDcWMbqStLYpZi1V6sQ", from: "B-mjtWYc6sq47J3eyBC8Ew", to: "f53xrN2GRYjs6pYUlXoEiA" }
#     - { seq: "lMwkH5qx84Cl3f2WCJ7GnA", from: "Vng6UZbmZNj4r1BHMr2Wxw", to: "1cDqBrVOfoXgTd5kNcyESQ" }
#     - { seq: "lMwkH5qx84Cl3f2WCJ7GnA", from: "mN1YZ3svRhw_jLYQo5SWwA", to: "r9U1bJq1OZkdmJWFHDXTCQ" }
#     - { seq: "lMwkH5qx84Cl3f2WCJ7GnA", from: "As4KXbigF_ZlhSca-r1tZA", to: "MKlIts7to1L22bmsvrUZ9g" }
#     - { seq: "j9kIfI3A3XGE1rgdh4ln9A", from: "jwxc9955M0Ze8IZ-wFbrIg", to: "s-JoQ2WGwngHAbQqfAFM6A" }
#     - { seq: "j9kIfI3A3XGE1rgdh4ln9A", from: "3y9fyBAVdZQO2HRtDek4ow", to: "X_EI_HdJVQ-55o9hql6STw" }
#     - { seq: "j9kIfI3A3XGE1rgdh4ln9A", from: "00yUNbHXBgB27Y770XProg", to: "yo1li60CPaGqMBOufB9-wA" }
#     - { seq: "qidqn6ItfmmYHTzqBy0bKQ", from: "93xjExFhh7abpFUJ5oBIjQ", to: "4X7Fkjcx04Z_H1vrS9IOiQ" }
#     - { seq: "qidqn6ItfmmYHTzqBy0bKQ", from: "kdUd6is9uViUEzpvaaO3tw", to: "FH9P19kMs2aiTUrSghSFGA" }
#     - { seq: "hjuIER0vjpTAH3tCjT4oMw", from: "rhsrk_R1y4QSXCwMKMCV7g", to: "7JE8O4fP36tVz_JoQqT7Uw" }
#     - { seq: "dYRM00zq6t6mgIu8nDfHTg", from: "wSUCFQaCRRnxakVc9fg1NA", to: "8g6AbMKaQFLZOlw-oC3zCw" }
#     - { seq: "GAlZxAbozyILLiAnbklXjQ", from: "ySRL4KCXkDwRess1tqgWHA", to: "j6kLOzvPRxly88LJBoVJ9w" }

#     1 (stadtauswärts nach Rissen):
#     - { seq: "8c1_G8OslL0aGG6la2r_xw", from: "PpkYSiIU9dzZKQzovYQD4w", to: "VWP0uU-tFLwmjdaRBGoMeQ" }
#     - { seq: "C6VUINH0APqogoyIzizQSw", from: "c89h__swVVV1ipFPGis-bQ", to: "IUNLkL_XzegCNSRsiOPLHA" }
#     - { seq: "C6VUINH0APqogoyIzizQSw", from: "xNYPex0aKNbleeFatBMI4A", to: "RAeTyJFMczVajFmUhvcBhA" }
#     - { seq: "bor_P477G7MpkLE-7bm5og", from: "iXKR3ZtiNrtLaiETvyPLbw", to: "UGW0Dm2fT8XnlFsAPh_Slg" }
#     - { seq: "bor_P477G7MpkLE-7bm5og", from: "K2t7HdHvNZhBY7YmodyDgg", to: "p1tqXrv2-B4GpUIWOJKPjg" }
#     - { seq: "oaXdSdkraoWgtfuPypLdLA", from: "hVo8YuAFc6xbMKfsoMov3w", to: "kSfIE7ef5RJ3fNY1kxYqsQ" }
#     - { seq: "upd8DaxWafzk6WgY79R8Dw", from: "t1XwcA1XSkJmrP09XlTbnQ", to: "hF-dZFsaYMjmHL7NCayjBw" }
#     - { seq: "t6t9l6dkgnblic9oioxofo", from: "VKY1XZprkzNYJNQKMvlcaw", to: "i4KfTYWaMaffDfSEu24UYA" }
#     - { seq: "-xdFKkludZ5xseXFAnTRPQ", from: "BcxLRKlt1X01ZkfSyUPxig", to: "g5oVRIXdiCcFGszpaK3cCA" }
#     - { seq: "-xdFKkludZ5xseXFAnTRPQ", from: "CXeVv5K2RxmSpSm2AL_GbA", to: "PEUJ-RvKZ88Y91V82NK3NA" }
#     - { seq: "lIcaoSKPicNk1_9PxgigTg", from: "p0Z3wx-9OGKpxRZW5n1hYQ", to: "qv2XoWxFJNAqqOR8jbtsrw" }
#     - { seq: "lIcaoSKPicNk1_9PxgigTg", from: "sYcDoxQ30IJjXuD02xqrjg", to: "HOMygM-dgEJIkYNImZnk6A" }
#     - { seq: "lIcaoSKPicNk1_9PxgigTg", from: "2_EB95Dc9WL6IY59XJkuDQ", to: "jabYJh4sv4RomyX2g_-vxw" }
#     - { seq: "KL9LBiV2Of2Rf6LmjsgNPw", from: "NUa2UegmoLIpXfX_2yWOyw", to: "RcXn3pIIHsTbUFuZPp7CLw" }
#     - 8gOTzRz25Qd5hveb-LhiMg
#     - 72eU4ZfPPcVltkzCAp8rCw
#     - { seq: "KL9LBiV2Of2Rf6LmjsgNPw", from: "RqhAELpJKe8n9CD2ykM-9w", to: "GxCmAZuJAEpMgTI21VKdcg" }
#     - { seq: "k5pONxSOrfuF0o_JwbLVNQ", from: "b8MXsuB6EF99Wi4g1C9Zwg", to: "LSVOPkcusD7yAPRZa1XZyw" }
#     - { seq: "PcZ-QshUBWw_vrcS2kaIVw", from: "GTC2PPZBNR6R2Hr5PQ86_g", to: "2WFk-O_1c1ywEioywRVUxA" }
#     - { seq: "PcZ-QshUBWw_vrcS2kaIVw", from: "pX5GVRbYExadZYZflZgN_A", to: "n8AUmmOhIfm0q2vqlJkB3A" }
#     - { seq: "OANkKX84r_O0Qwmxo7sD5A", from: "_Idfx3oQrZ4tl1vgv4YaHA", to: "ETsZSseV1jL1mhdDiNQkCg" }

#     1a (stadtauswärts zum Osdorfer Born):
#     - { seq: "mEGl22xVXzjEyr31HcdCuw", from: "dbwfwAn0JgaibLU4Jwvo4Q", to: "H103JVZZ54B5Yy1vTcp9Rg" }
#     - { seq: "ep2Nhn1h-7I3Brpq9uTl8w", from: "00nrXZ5NrvLvdlH6tNi8GQ", to: "nC6Xz4LJ6HY4ckDd2D0hsQ" }
#     - { seq: "ep2Nhn1h-7I3Brpq9uTl8w", from: "ND-X6kmg2jfDTkhFQCybkQ", to: "aiwiOUJyYXHPu_PcZAZF1A" }
#     - { seq: "m8QU_MsrE1k9jfs3xe8NtQ", from: "0xK2xZeo4Yi794lVVzlNXw", to: "aY1YNwBky8M1DrsR-IKCFg" }

#     1a (stadteinwärts vom Osdorfer Born):
#     - { seq: "m8QU_MsrE1k9jfs3xe8NtQ", from: "aY1YNwBky8M1DrsR-IKCFg", to: "My1Y3JoX3c9pY0iYAgxPzA" }
#     - { seq: "YyG1ufreS6LkaLma8Dzlxw", from: "NuySvVgCOWxvlWqjeenqeQ", to: "B_L8ZeTSNyw1oFMoWl_AcQ" }
#     - { seq: "YyG1ufreS6LkaLma8Dzlxw", from: "-v-n5njkE2RqU_xNzTjazA", to: "jQyMcVxr2uaol-WzehiW8Q" }
#     - { seq: "JrwSDcWMbqStLYpZi1V6sQ", from: "SmhhFDLAjf0l4Cl3Zns3fw", to: "lXVHNLck--MewkQVyyg32g" }
#     """
# end

defmodule Data.Route.Route1 do
  @behaviour Route.Behaviour

  @name "Alltagsroute 1"

  def id(), do: "1"
  def color(), do: "#7d8b2f"
  def name(), do: @name
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/194843"

  forward_rissen = %Video.Track{
    group: "1",
    direction: :forward,
    from: "Innenstadt",
    to: "Rissen",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Rissen",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011629", "0:00:12.246", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011659", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011660", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011661", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011662", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011663", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011664", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011665", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011666", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011667", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011668", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011669", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011670", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011671", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011672", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011673", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011674", :start, "0:01:14.000"}
    ]
  }

  backward_rissen = %Video.Track{
    group: "1",
    direction: :backward,
    from: "Rissen",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Rissen in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011675", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011676", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011677", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011678", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011679", :start, "0:00:45.178"},
      {"2021-06-05-velorouten-1-1a-2/GX011686", "0:02:00.187", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011687", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011688", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011690", :start, "0:00:15.282"},
      {"2021-06-05-velorouten-1-1a-2/GX011691", "0:00:01.134", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011692", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011693", :start, :end},
      {"2021-04-18-freizeitroute3/GX011324", :start, "0:00:16.683"},
      {"2021-04-10-freizeitroute2/GX011183", "0:00:01.435", "0:00:51.818"},
      {"2021-06-05-velorouten-1-1a-2/GX011654", "0:00:30.964", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
    ]
  }

  forward_osdorf = %Video.Track{
    group: "1a",
    direction: :forward,
    from: "Innenstadt",
    to: "Osdorfer Born",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt zum Osdorfer Born",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011680", "0:00:01.000", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011681", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011682", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011683", :start, "0:00:47.447"}
    ]
  }

  backward_osdorf = %Video.Track{
    group: "1a",
    direction: :backward,
    from: "Osdorfer Born",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "vom Osdorfer Born in die Innenstadt",
    videos: [
      {"2021-06-05-velorouten-1-1a-2/GX011683", "0:00:47.447", :end},
      {"2021-06-05-velorouten-1-1a-2/GX011684", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011685", :start, :end},
      {"2021-06-05-velorouten-1-1a-2/GX011686", :start, "0:02:00.187"}
    ]
  }

  @tracks [
    forward_rissen,
    backward_rissen,
    forward_osdorf,
    backward_osdorf
  ]

  def tracks(), do: @tracks

  # legacy
  def parsed() do
    %{{id(), ""} => []}
  end

  def index() do
    %{}
  end
end
