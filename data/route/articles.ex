defmodule Data.Route.Articles do
  use Data.Route,
    yaml: """
    articles querung-kornweide:
    - { seq: "8Kjfl3wN5Ie7BHULbS0tGA", from: "EznyzjGzITAX8_STGjKi_A", to: "EBY_Awx6Kmw2MRaiNOb1UQ" }

    articles hammer-landstrasse:
    - { seq: "9n_fkkB3gASBnYiGffTqSQ", from: "43A88jFaZMXeE1qiMjchIA", to: "5NBAMnIk4_w5AbbhvtBmZA" }
    - { seq: "q6c8LCM76To_ACWPbykKtA", from: "tC2w1yrJ0Zhgybs9sBUNOw", to: "0y52XVKw9PYU7IVaXrNURw" }
    - { seq: "P5EIl_rGDThwfOCo8PwkiA", from: "AYANpi8yMTaVQwujovLWAQ", to: "PtINS-li8mQe-oBmZ_RQyA" }

    articles wellingsbuetteler-langstrasse:
    - { seq: "dyjJNotyKwLYJD2z2XmKrQ", from: "eKOJwLvnVaHWrtHJfqMbkQ", to: "Ut-MfQXm_Hwudurb7Bp7Aw" }
    - { seq: "dyjJNotyKwLYJD2z2XmKrQ", from: "_s-WVg-kR3Wt3Yfj6--VdQ", to: "EWz3GQUbrcSD8Fli9beRAQ" }
    - { seq: "tI2FKEsG3grrahtQN_B3Ww", from: "l2Wd9uKK40DRDEyL0vwJAw", to: "7tnFr_kDGXBn2KX2-7e-Iw" }

    methfesselstrasse norden:
    - { seq: "bomQcd7nEULMQqhqXOiRkA", from: "5wdE6arPtjJdCdnpgEhKjA", to: "vpfnLSGxdlIOn8A8zlgfIA" }
    - { seq: "bomQcd7nEULMQqhqXOiRkA", from: "IAk6MscgJNiMQYSLHym30Q", to: "vLreSmuPuUwpEv-5xkfv9w" }
    methfesselstrasse sueden:
    - { seq: "VW0hxulSqtEuhSwHaG6Fsw", from: "iaFcI-InWGwtuOmVy7KScQ", to: "_sapIa9tlH9EqgCwgurtmw" }
    - { seq: "_UUck4WKgqTGX_ZoS6RJaw", from: "brif-8icsKdYHSR5aatb8Q", to: "AND85P0u3cEUPECNFhjt6w" }

    articles zum-dubben:
    - "uhF3_NofxYm1vjevwPb6yg"
    - "Sjo0PVQ7bHMbJD2w6fV0ZA"
    - "eYKtuR2p8DF9RcJFow5sHQ"

    articles suelldorfer-langstrasse:
    - gO0wvvG-aVzGadqAQTmhSA
    - EfZZqi08k0qGiU-LDxX7zA
    - xkM3TVkXy5gEbFKfEKtYVw
    - uEeZ1EtA7GLzT3Rv6A9_Ag

    articles 2019-07-13-14-rahlstedter-weg:
    - buSi61folxVO9eNig_Yygg
    - xeGpglGHe5WvqZs6KdQtgw
    - 0yeUNJSNLbDdla51jws6BQ
    - m1pMG8o-YvxhmNyCfpezow
    - ntVbS5ks66FeyziD0jY6_Q
    - lobOPTwbZJiJsyld114HkA
    - Pz4ajVohScFZOTu0ab898A
    - zkGChE05x6PAruHhLEzNIA
    - s3SkreN8rUKU_auL4_qU6Q
    - z4Guoyf6Px0IQ14SFoRUJQ
    - VB1gDgYdLAJA6w1IZFYeGQ
    - E2fffiPl6U-Hst6CYkR0eg
    - aHtB9kDaBGfaY5jFU0arjg
    - Ct67L3iemX69_6RWT8DSdw
    - uKIV8tv8ze5mhDjM7bBH2A
    - cUZmx6oGfTMmxi6MKbS4ZQ
    - GxCIm9X2yuZ1P5AU8FD7RQ
    - 12YPJgLt1LoZp8e7Sr5rig
    - y3Bqo9j2gTx2JCVRROqZZQ

    articles 2019-10-13-4-fibigerstrasse:
    - 8Raf4F3HgpRXjmJG2g-UtQ
    - 751LL9Lre9MsQyboBKWOqQ
    - IEFMg_80AMc80mLUYRXTLw
    - Lk6Iv-G6V2r7AH99ZjPjcA
    - 4HbpYQmHgiCoqWp3CpYcNg
    - no6LLNUrq9ZbpSF0caLIYA
    - rVyjYQDBifS4CMb_LsHq6Q
    - 9r4hwZCygETcVw6k9VAA6A
    - SmwioSzEWk_hsRTHQhVsew

    articles 2018-09-29-1-blankeneser-friedhof:
    - pfVytKPTsgFca__kzZwe5Q
    - -xxRsy6BWuiu412rfYarvg
    - iYbM2oHrCWvdgAYkcJ8wmw

    articles 2018-09-19-3-kreuzung-gaertnerstrasse:
    - KHUIA919w_DV95O-SZJ9HA

    articles 2018-12-21-14-niekampsweg-baumacker:
    - G5CWeIa3_kTqkmBhrj_QLA
    - szpH2nuixvs8ySMatYg16A
    - W4SJfijW-40gYNztb9CFYA
    - nZXn2Q80GiPNN7Iy8Evv3g
    - tDewbRbu76t0DvYHavQ1jg
    - PXBcC1M4Q2LToktX7g6CeA
    - ehp-wFMmE6wd-Okn5_DNkQ
    - MYxkiXlWW5pduEYR01bFxA
    - Iq_Ola9NgRO0_NQvhAlpFg
    - 4ZoYi8oXiXnzgf61L6TsaQ
    - Sywe2HnRl-3GkHezcAYbmA
    - 1RU1mwLBt8s-l5O1ikK9cw
    - nmX6b8ojDU7gdENnPSxHSg
    - Je46m0PZ0vbC_GW6ZCXMEg

    articles 2018-08-30-11-innenstadt-harburg:
    - e0xm7filkqb-1zXmVdoi7w
    - Poh5OCDMVVe7A4OCPE_dLQ
    - pK1KgSiunKtLuhX13BDDYw
    - IEHJfdE64TXVL2DPR-t4cA
    - tz1pv_URSzdi8dthu2EKMg
    - uA3uWgJxQoIrrs3JHxsf3Q
    - 0BQQsbkeuU4aNHuaFnEy9Q

    articles 2018-08-29-13-holstenplatz:
    - SBEKMxDdlIanphEEoS3qBg
    - 8r2gqBg4gCqZBabWw-npgg
    - E-XBEwuLUHRIhyQ9uP_8aQ
    - M1TgUI8bY3S5XhZkrP3FPw
    - d5aiTbJc9yNXN_geOrwkMQ
    - CnhMH-ncAmq2CLLGkrSbEw
    - hhUNX4cSeaID0VSn9z9Mfg

    articles 2018-10-21-7-rahlstedter-bahnhofstrasse:
    - QQdnLLW5u119Ri0X9qOUBw
    - fsVhZIM8SriYsstLHEtwLw
    - jXa3QWjWpl-WBAQgYBLpZg
    - EOPl0Smw5Kt5_9bHLP5P1g
    - 8d9Od5q4PG81UaFgllGi0A
    - UJWimk65KSwzyBx5S6H_Sw
    - 7p94C9SshaDgTfvN6TYPgg
    - KW-tX8wbKHh8NkjxM1fu_w
    - 6sCmOml6zhgrzQ_FsW_GrA
    - RXi7u7Ph3NwiYq1SNLLDAw
    - 20DZ1b8pVx9RO-njQ7qdUw
    - R29beSJjfbTM7m4CVW1Ydg
    - IvxKjKIjyEQJgvySDe1epQ
    - eM9gWRKo4QHdXjN5ywoLbA
    - nZbPswAP9fWvW1NzakDBxw
    - qWk23UyOXMyQt7cNZisGDw

    articles 2019-01-10-11-veringstrasse:
    - UQ71hrJeXeC93IQxeuyMDQ
    - MKv3mW8WjBqcsVsOzWnH-w
    - qAyM0fIT4tQ75IPZ0ySU4w
    - Tf2beo6Wk4MDE7eASp42OQ
    - ZsCQ-3ijJl_dD2VIr7Xkbw

    articles 2018-09-02-14-boettcherkamp:
    - kEiDHeOit_QIah8w5-xJpg
    - WFTWhVY24R-4NZ3sEGZNgA
    - GSzmixpNxjcXfNwQyTbYBA

    articles 2019-01-10-1-ottensen-mitte:
    - 2mEXfCAh4hvQZJ6DM2ZTzQ
    - QLhdQHosNcpTRPvmITumrQ
    - MgZf90wtq8wF7FiA9CJ1tQ
    - 5ek49L4FwroCLwbgcgAQmg
    - QfUx3gpVi54x9Hp08B8mQg
    - Od9_m1c92q3FAKZQiYKUpw
    - nVYP5aSHo4s4hmXXO6ebIw
    - nSuY5eQJU3152MUeUW8mew
    - P-uoY-njdjjC-yTcIKzCFA
    - sci7UD2pE4YHT7g1wBqdbQ
    - y3d1pFq_oKza5MQrkV70EQ
    - Y46KLCJWcBIHYIYXwqjxGg
    - _TNzXpKU2nzC7u-r141VzA
    - -rMECPgGYmivFJ5wqK-uxA
    - RGAZUlyvRPX9yyLAD9hQtw
    - 6AkOvdNfodrP7X-upJwcnw
    - vh7nxam4OhRa2J8NmspXHg
    - wJNy86-ZS3rn-jRCX_dzxQ

    articles 2019-04-10-4-kreuzung-neuer-jungfernstieg:
    - EWyGBNzBlzNnwh3YTvxQlw
    - Nb-tt5p34NRNQtLw02jYEA
    - 2spdIaeNN8ticy60bcMOcw
    - G7i57uprZH0Ps3KCfxK5Jw

    articles 2020-05-31-heykenaubrook:
    - L-xSKbsYArOZ0K23WHpH9w

    articles 2019-01-11-6-beim-farenland:
    - A_WI53-S7c9vU9OulS0lMw
    - _OQe5CcmbwEtkmAl17NX1g
    - o0blAi7gJopk6nEP_AU6jQ
    - AUR4r49JcrSJtFTOKcQWDw

    articles 2019-10-13-7-luebeckertordamm:
    - v13tDJqCSkoUPTH2JzjUUg
    - jjYhOlnvT18ArD5h7ZS_Vg
    - 49lSdizogxGFac98i0nVZg
    - fhPDzVQ4gWGp0DRk26gFXQ
    - EjlrGpscWM57yiRHFzXokw
    - V6QX131H-ZKyvYz3e7RUfg
    - l5y5ZsWCvX6N53Wd5NNrsQ
    - GTEnbixUsyOtjD0WeYIsmg

    articles 2019-07-09-13-gertigstrasse:
    - GRXbCedhi-izENYoz5CVtg
    - 2nEiFZF9JGwAz6DboHlMRA
    - YSN7O79Gh2_gUJeqivFvmg
    - 0H2NROCefot1Yh43P3DMUQ
    - JyS6tFIhP7oW9A7cxfCyJQ
    - YCMCwqd3Sy2CRPVta-Vl0Q
    - Wo63ie4eoOL9CX7WRswArw
    - e7nYKx0RFtr1yJSZxbJzqQ
    - xwZr9XbXKxLgaXdy66TJDg
    - NIaKUXNd6GK_F7xCUtOqoQ
    - HDQj4Z-iG_z8K3_tESMQZA
    - 6hSGKVsDy97X1QmMvbADgw
    - FLl9pSpoMRGjv8Eg2SNkKA
    - mnhxkxaXfHQd_lY6-pMDcQ

    articles 2018-12-31-10-veddeler-marktplatz:
    - aS0wZcULoeUqaS4HCkTfCw

    articles 2019-02-20-binnenalster:
    - c54mvNGX5J3cp2KiI77VQA
    - W5o1fYjrRmnRxOjRDG-1_A
    - L56oyH4qQWvhmygBXLZyWw
    - 2gjAPnXyGJoeJp0ImMMx1w
    - jYxhLwalbZ-z8J90bjBMHA
    - wqqp-Wj-8WaEiMg2zX8MaA
    - wXcsTrgVg0l_Spbv7n-iZQ
    - ZVQbTptPGPKJlmJEGdDNGg
    - lHyWuohTkJJKd6L5ta7U_g
    - RH6FCMuupJZqkW8IgGNILw
    - KpiXePkLhGXVnM_I9oI7HA
    - 8ojW_2spr417X8WGhZuP3g
    - wzCsz17Oo77rKJl2M9W_6g
    - 2ASd5-WDELM_gmJTexQtrw
    - X5CyqNjmrN9-UNaHKbhovQ
    - ePnJABZrVQR7EHoVmwuABw
    - 0SxedkgwZ5ZsQSGmrqADtg
    - 6KLIG0-yTtLcfO0q5B5zEQ
    - iXORGp3uuI7RCQV_UWrwkA
    - mcfccCeIHQeO1H0oXr4ikw
    - Lm5AQ0VMzX1N9zdy9-pXDw
    - x3Kg5mo-BAHbJ83bc56W4A
    - OQGdnfEDKdMegETVyHI8Mw
    - MHqSMHP37vWJCPHtfFNMXg
    - ZHEeEsPnNqSXFFLprBhynw
    - mELCKJrP4rQxhy1XkejN9A
    - PjlnzRC4RRnjM2c8B8I-Sw
    - I9Ttd7xHEW3HPSFKy_aiIw
    - _FEWI20O406oPqlLzhbNPg
    - MPB1sf383TIvjzjUfCOHtg
    - A3wZ6jNl7FSAfy-vnIYn9g
    - CpShLY2J3-souXYrNWqkgA
    - I5BYUi4OM7WhxcZ0ZDAGVw

    articles 2018-10-21-7-jenfelder-strasse-w28:
    - yOw9ipZOLz9HNFxE8VFoBQ
    - djTqsJALkcmQQIuKoxFQRw
    - DLj74jOXTVwUXuosdaXJ2A
    - 8DXO0IJCCU2pDRIUA26SHA
    - 3BhLro1KA-Kjt7zT71MkiQ
    - 7X31tIegCeIbL0UQ5twgEw
    - 48L7LUGPFKmU5JxpIrWCQQ
    - P4NXRfxNvBbfTv2b-JH5BQ
    - iIJxTNuRvVmVFof3gyVt2Q
    - 9N-Dmv3VyolFbTkrVP2NOA

    articles 2018-10-14-7-schimmelmannstrasse-w23:
    - F2024q_K_nNi9o2oX2dUgg
    - B-KXc9xGV5F-MKVYqOeuMA
    - lgAKnSPo1aUOg3KfwnL_cQ
    - AvCppavKZYsWqvg5x8r4Zg
    - tEcwguoM0WjhLEXS_7anWA
    - oh6W9JO1l_l4lytlCTVemA
    - ps5g0Tk2M2RQRNSIE-zCww
    - 2uipyKZCSFCe3Oq4iNXaJw
    - ut02xlcQnAQy1ueMwfgRhA
    - ssqmlfQl4xBzfN3OXBvPjw
    - N9c6BzKCDPHwo7Cf8KOcfw
    - 7GE9h38lQ6kU3kYVZx0vaw
    - EytIztXe2n5zK8UScDQHLg
    - H3ttbtVAQCh4lK-bkSk3mw

    articles 2018-10-25-5-querung-bramfelder-chaussee:
    - xoQHcRZwJCYogfTPJBNQvQ
    - L03oD1LsaLg-OQgNqp9Q8Q
    - bI_lrdQrBOBpefsmR_rajg

    articles 2018-10-25-5-am-dorfgraben:
    - UG3BP8Z-VX-EtIhatIgupw
    - JN-2gwFKHHziX2aTLcHSPg
    - 4Rp_iWjEvmCEC-KntYfjzw
    - 30ECh7qy9sbXIoRly-n5JA
    - sxj5x_wDWgOIjeilUyCcJg
    - ArLSY-j-NIdBH-U-MJJ0_w
    - 6mkOOGE8JdTz0zVadINfbQ
    - WG2YkzV46hHkxJhOSHu7eA
    - qC2dLQAeL9U9uWQAw9PpPA
    - w3aH94mg5kZEotsWfH-s0g

    articles 2018-12-15-8-lohbruegger-markt:
    - q5e8MVMGFk4d8WSUtANXjA
    - 2iNBdQLjMz6KDutVkVUmfA
    - TTnOY1AWgVFRwf-vX1UXKQ
    - dKTke913HPMLuYXk_KcoKw
    - f67dY3i3Xz4txu6RXOSTbw
    - neY4EaK9empsb6wBCnSJ5g
    - pDtrnDGiYUt1G80iCl-C-A
    - Puil3PEUWKku0YW_6eAtjA
    - tCaxiZvTOhDtiUROW8Wm_w
    - wTxHict3qTWJ-G-u7_6wSg
    - E8Kbr9ZCiJ9u_DadpvaETQ
    - lSF_WAYgguhzSDpSgqNCsA
    - euV2vB09gZFftBb06Eq3fA
    - 7_uQZRgQ1V9hEGiggmTrNA
    - ONdtA1wYPuVUjxkJXRymKA
    - 80FN8cFKO7NsGXNxZuqWqw
    - PLFQwSn9FcQXYWzorRQMxg
    - ti-blaz9cyPEJbMDT2TSEQ

    articles 2019-04-25-5-heegbarg:
    - 99PwOPRUzieQ4nfbVRGDDw
    - -6WWlNmruPZodKxg6EeEqQ
    - lZtqKNpV0hg-YZ8xWTybww
    - 4hOlULvq6DBYWeugLVdLng
    - Xp82rJ5i5_HNWWv_UeePIA
    - LnvTp-RwpL9kjM2rsjKdIg
    - ed15qHE0QclHdSyh4TVK2g
    - ZoO2JuzfC_1xbT3tj1Obmg
    - A61KdL0k1loKSRj5Q-vmIw
    - 5vXJVMiE2tpz_vjFgqYX-w
    - fhzrwHfAbjiuPhSajMYj0A
    - _vs6rcxcyaG8pElkGN63Ig
    - f_5aDUZqOfBA79DYAtVT7Q
    - _d01zr2jwTXjgtqSAvA3uQ
    - sM7fnJfuLZNxo0wwFTBRdg
    - JymyL-pkHiKSCxvtU2PM6Q
    - FIcNa-_XFbiemyVlcws9Zg
    - 6bfZs6gtzh4SLknnCH4rwA

    articles 2019-01-09-14-gehlengraben:
    - _1CMUs3QEE5JPAoqSJViKg
    - VaaeWnONb3zMo1HVGDyupA
    - 4m_HAkjXzrr2xAs-zIxnHQ
    - 3v2UHMNaxgPIah9mAGL6QQ
    - klbtayLjSNiRU_LNM6Ou4A
    - 7FuV0xgwsmQcVWq7U1TzCg
    - yZQyNA2OrJqL3zDuI32X_w
    - vgyYsj2RC6zoW_mfQ4Hy1w

    articles 2018-10-13-1-geranienweg:
    - z9E5eNmWX8KT_R8763EcrQ
    - ty0MjVgKYoD1mibL5sHjVQ
    - d03DjXwTmrYJD6A_Q_0y1g

    articles 2018-09-01-4-krugkoppel:
    - vKwtpDBcYeCCRj8V-X_48A
    - CUV_L1y-MQpMuJ0UK1zXhQ
    - fRPiug-kxmwlt-ksLBP_gQ
    - YzwIhOW3lzY3XfRcGxWm9g
    - NgF-z3Xcc375fcFKNccUow
    - -_6JY2gD4OvxYbzFQIXQAQ

    articles 2018-11-09-10-cuxhavener-strasse:
    - WV9cpGYiXwSornbLG4Y5YA
    - vAGEFhI5m-cLbM_wL0i6JQ
    - vvtCP7kApEmONXCn9jvo5Q
    - j6bR0xMP0fNnM6VEyKtLpA
    - OzI8ZkA2fh0R7Pl9TyVcIA
    - KJMIYwF9yYfn3tazcpg4_w
    - Zxaa4GyAEDEfPuS35-I8bw
    - eDOSar5Y38OqcA-fX2UEow
    - l9pNLg1NmRhVijoN3cwjLg
    - SghMT-lJcZ9muKrfTlUsRQ
    - a2Q0-HFLwbDBFZdgWxft9Q
    - Kuzwe6Tumzh02biSwfaNTA
    - ggjlqR2j5rngAb7Juwcy7A
    - VMe-3YTlHKYvw3PZB8RAdQ
    - i5JmCZn5LW9Lh-Q8tiHlxA
    - m2b3UjeTMacczlGc9EEkmw
    - Jb4uDC2JnffbzHWIYTsESw
    - vUe7N39CJS1abPKPFBWKbw
    - -Slx34QSHbOE2pvibslb5w
    - tGpYRHiLMyXPHSzGbpBBXg
    - uqbJ_GV1LMHHVgZobf7KTA
    - ZnfoS4VJxmowbgymBO1uPA
    - 6Wfic1-ZlaPEE9BrZF9kDg
    - dBVAFonHAwlx1t4SKq7mmg

    articles 2018-12-29-4-immenhoeven-foorthkamp:
    - 3tGVKg48HNzagGzauedmxg
    - Xbo0B0_CN759N43dUQEPkQ
    - Bn009Hae3J0l6DbckAahQQ
    - VAgMdT4oQe8wsHpSz712lg
    - doyFPlqCTn_2vAqe94n_yw
    - dBcdV7yVix31Z8HQq2j-RQ
    - F4Qw-JTLEiEKOkZzQvkDXw
    - 1QhTTRW7QDOhxmTeuhmQag
    - mZ8p-UozGl64QzNKhPpcTQ
    - sNpf-NVwkbZN3DcAlzAg7g

    articles 2018-08-30-7-steindamm:
    - vqaa8d536GbC9u3NQeXMlA
    - 8FTsePivRQHDANsOuIT8eg
    - dwBuU9cde772-AGlJaIHnA
    - FWz9Io_6FrprkFQyv0EZrA
    - QbMhNQohRUTiO-MqH17PFg
    - 0qoA_0UyVsvyXMdu0oxJGw

    articles 2018-10-21-14-tonndorfer-hauptstrasse:
    - TKH8zxPJnPClAmTIjD8bdA
    - G0_QEKcwvjVtzDI5gy8qMg
    - D8gNnypN8UNE0PDT1Z2x0w
    - XT8ZOp1-fqax-EeHLMFiEQ
    - zuYbKJZEXUpvACk1zqKVmA
    - AjQ7ci8s7vIv6Fz4McqeXw
    - 9pVaX5YXbrZFv4yWuGlQmw
    - aKLVmqKNcbS2VQMmZCD-qQ
    - nJvaWBCngxQV6L2apq30Dw
    - 43gbWliw-a4JL3WGuy61Lw

    articles 2019-10-25-7-hasselbrookstrasse:
    - siFdtqrKkqChTJALnD1WSg
    - uvIKnKaQKLuHZVCg_5541A
    - 8tFPQJt93BTN9IaRGoTF4g
    - DqY8JQZ0e41Bf5IcA7c9NQ
    - XqwaxekuQ5oHYUkVuISScQ
    - ABfqj72vjL2AEfZnt8lxTg
    - EkLZyr3YbI902S5zyPWElA
    - BJARlvAz-RaDJy4it1MM8g

    articles 2018-10-15-6-friedrich-ebert-damm-w17:
    - ACemcCqTyRszD5Jt3lNMaQ
    - HCKGMRljlVYvG_8mNnKaOw
    - uWsJjCYGtLwairQ6FGpjFg
    - UvAigDiBFgQV902SijR34g
    - uK8sWe8SZC0ThvWIYb1xBQ
    - 0tUXGuVp7zzs-2iX0sOX_A
    - 2CqOquKDnFG5_pvpGoK-ow
    - 2p-6lITERo1VI_07gFrq7w
    - OLQUb0OYzAK82KW5c1__dw
    - wYpYZp7TfnEVI2TSGnnVzg
    - fGIZRFV5ih3nHqBIazLOeQ
    - SbfiF5qgUycVmHuEFPVGsw
    - xiG8L9NSS5X8myejoO31ug

    articles 2019-04-25-1-chemnitzstrasse:
    - pe4g-cPzEz1w97DP3debeQ
    - Ms3aeYxVRx5VLW2I5svIGg
    - bJDVVPB0nIoNrEsw7wU1Yg
    - APAplV9Wm_5F-PguAwcZ8Q
    - DlWekdOsKvckWlpvKz1NSw
    - OUdHtT5ccpKfLxRD2wFWGA
    - Km3ZR71K2NNoggxZCrcBQg

    articles 2019-01-08-10-binnenhafen-harburg:
    - 3Dw93V99Va9vap1m_sWzKQ
    - ecdUMa7-3PyF3MS-Jp-uJw
    - 1yR6_1b8Bf9MC7q8RSXQVA
    - vKywhWu83ZGSd6IyFxW0LQ
    - yWRjdMybdxasH0rllE9SyA
    - IH1if930EjSl-jc5Pp74aA
    - pJpN4BtYgXukzpxytAYNUg
    - Xo-uVT3Jf1r06bbPw3eb5A
    - WtrWw4c7ZuzQ6PHeypivZA
    - n9Jtgy-9s62UoQR224WTbg
    - -S6jnEf4Pzn88sXzrAzMWA
    - LBzbIF9K61CnW_RLOJq3Pg
    - hHg2hzi0Z9B_hT0E3_fxZg
    - 8hpn3egY7EyQr4yIRj0iKw
    - gfz4efrVxeH9YIXGLzfZSw
    - iZv87P0ekcFOzbl72Vx_kA

    articles 2018-10-25-7-kuehnstrasse-w24:
    - ps5g0Tk2M2RQRNSIE-zCww
    - PW6s3Y4L6Qo3L1CV9553gA
    - BSVDbjxXLAzz--n79ebOSQ
    - Qfdy4dcR2IGtW2lbdG7wZg
    - idp4xkWlYxmrSq_TSyYnKQ
    - GSsZz1Ysf-sWe3BIqHMbOQ
    - ADuOp89HtJWaq1aztdMS_g
    - vwCaPtJfu2gn26Yn55BLCQ
    - k51tDa-t6fAxPD0vMBN5Gg
    - R6fF2FADHXkRqMyRhOq4zg
    - mSxu43OFzUqvUNWmKawmCA
    - mKRPAQi9ot9arJgmgClQXg
    - OmOYflEAW5R24eivBVX5dA
    - PfikrOSvzhJUHdyzeRwFyA
    - dQu5mUh5wNIsBXAr0YjXsg
    - pJRkEUgYYoDz25Gqx-66MA

    articles 2018-08-30-7-rahlstedter-strasse:
    - pwuW4ksOJZlXcXePhA9m8Q
    - E6iwb1GKHWU-NRBVyG9ibw
    """
end
