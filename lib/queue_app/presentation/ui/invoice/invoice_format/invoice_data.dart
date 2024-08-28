class InvoiceData {
  static Map<String, dynamic> invoiceData = {};

  static Map<String, dynamic> localInvoiceData() {
    invoiceData = {
      "imageLogo": "iVBORw0KGgoAAAANSUhEUgAAAgAAAAIAAQMAAADOtka5AAAAAXNSR0IB2cksfwAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAAZQTFRFAAAAz1QA4UPw4gAAAAJ0Uk5TAP9bkSK1AAAMP0lEQVR4nO2dvY4cuRGAu2d1GF2ilSOHM4CDC8+hA0NaQYFDP4JfwaGDA3YWPuCc2W+kWcGBQz/CzBN4pMSz8O60ySr+VBV/m33ynm0S0MxON/k1yeJPsVhsjcPCMHZAB1QBxstw3C4BbA7DtFoCmNS/+5t2wNWj+nh42Q64PulcpMtQBLzd68+7XTNggs/jthUAVTAMn163AtZn+Hp60QqAOszVYgmAdZiJVwLc7vDbi2G8MJGUAJP5Pm59nliFFACqJ2FwYtBXaMsuAECK+xvSmHWtUqEWAFqK9zeqIly2da1SmRQA6nkqKX5imESqAkANBiq/qtz2odgySSWUATqyKoOJiC2TVEIBoEo8IscIH1smGR8KgNsdFF4lMwBsmaQlFAHwMFVyU2xsmUQMAWBzoJcmLK4fmSeZTALUs2j+bMLJfNuWSbqGAOgyeiGp+PjjdocVb8YXGoWnhyf4Olbx8Vlv9wgw4wvpWwKAUnIXFQD/3hyQqu/f3dKGIAAoJZfB9dnU9/XJAR5ewkcCgJXs+OuzqdHrE/4BLVPlKwUwdeTkYNM5ErbMiUiKA0wduXZic67IeA2Ho7d735I4QOUQghXz9cmUxgKwZW4OKYAdg20tbg4GMF4sQF9QGR3jADuE2lrcHI5bA8CY2CKddCXADaG2kh1ApTQAnTkVz7VlBrAN1VXy270tDAJsyikBsA3VicEDbncjK4lrawygG+rD1xd/mQL0M70w4gAtxRHb+84AbFY5wIM5QElRVR+ZezwA/7p6tA3yuI0B1HilUyqOuY/P9QDbor10OGDC36oMpiFg1VEACjgBUHmHB/jeRgE6bxZwfYoCbEILigEwa66PBAAEm9mAAjaHCoBqR1j7rrtKgE1oQQLg5h/VHsY2gHmw664hAMuYAGwOpuhuNJ8JeLs30iPzyUyAG3/aAHb+8lPhbADe9n/JhlQA+GHCFmY2wPY9OxrLzpQHkKHSzqWyOxcB9pedkeSAkm+JdvIYfLeVQ1oeYAe8gc6lfFDN90Y74A107JMAO6DMBuDEkh+R7F1SHXJqy4+JOYCRkM3ZDACf3vPzAqmZYUKAVDDyMxMD4A2p4ti2Fp8bowCuZOVnZyIb24ukmme6S0LBiAKEoomPdmNmERCoulkdiQiXALiyjaOemkDKAEgYqPtZPRHHTQlAqB1lcdJLaKoUYAcCueTJ6soxgFx0ZbX1OIAv+2CpoCjVALnw1JrkX3+dWLHEAHLpm10zJQBs8Z1dtcUAcvmfXTfGADrLdztigMitXCMNCbO8PfgFQG7tHGnKoREmt3qPdKbQDJSzH0S6szdE2dKhHH3EIkCawrBMcRtKFBAY4zJWnMigGjEH6ixRW1gJEBgkM5YsMunbicVmmbb9C7ew5qe2IWKUdfpsJSA0C7/5SH4kAERZmWGYjigYOtSbxhOAeuN8RMmCGNXbA6zmaKlv9un0BUVTBre8j07vEVVXBts3iWDzynYyA75t5tV9EayNRgebxfyCgzxSJ/Al8CmzSx6aZUVwAyQEk9vsossORxjufjjTnya30WWfmYz5E4dPmxP9aZeI5JJceK7ZE4en9yxDdq4il9zS1+hAvATDsNvRXyZubvE9Ddlgph5yRSz/RRUEAeNmDBCiCoKAcRMmEP19fYol8wFlHjPCqEdrgKxDGVCOGTMQa7j2GfYPdTMC4IaoiBB8F1O5xIaQNoWxjmAC3SwyDSFtjIsIgQ6uVnFjAGYO1D/IHKR5dEqylh4GYAZJzA4rH82Biov6OAUwkyhWCL/JJgFsigzAjLIKwCekic2xdsxgAGYW9js7vgyUaEatIA4EHXGSM5qqVUhighk3OYCYxk2HIMH1NfswXIuwOMQ4r6KLoV0h6RUzd3AA2R7wO0MuTCxPUQDZoLByJoFvVZr5c5Rx9CcaL+U9oR0ZhUZE8hqRG2HpTd4UYwC/TSSUMUxCAUaLkdl0G1WRGZ4umZMAt1UWmaCrAKqg45AAULOB/hUH2ODneh8mDkCrSBoQKofs2mKAUciTgCloiMz6UwMIbxH7UxuArutKAKK2/ogAuiiKAMRkOhsgZ6KI30YeICfjCIAuywJAMJfOBYT6SFi/ZFUVAkJ9JGzKWUCoToQK+9VjGhBRJ8JKyAFiKllQCTkAXUvYEHTHHCCmkh23MwAxvTgyqiYBUb04Mq4nAVG9OBBDBhDXi8NJw63VnlYcoIVw3NLIulalGDzg6nHkAKHDDdaNJwVYn+92DKCeJ+t8CuXoAden+xsGmMLHqUxJZhqgpShrjHlalADcfcXGzgC06VAAws47BdA0QFX5cSsBtzs5MKcB3l2IBGMSrgK4bV4aQmoOEJlGQk0xDRDebja6bBtpgLHB8+A2F6oAMZvJJEWTBgRR49gcIGZuCzS9JIArgC4EymoOEFM0OOCwTQO4DuuC2yiDOA8vcoCoxZAaBYfrf6zSABaTAghX69BzASxjm8PdLgOIWv+YppYFJOyPTDh6zyMDiPviTrWAhP1xDuC4jQH85v9PHsAXEj5474FmAN+6+pKAuFe43Dz7CQOouDjguK0ExJdOiwF076sDOqADOqADOuDLAt5dnhvw/nExwBummwC/OUvA7bjzafX6Ig/47UkCJqpprf+5KgB+d/D7CwAYLz62sdFnAR92AnD1yPdwlNaTA3x8M/hNmhbAMIQAvglUBsDNZwX43b5GgN+wfC4ArrvbAWTbuA1ANq7bAGTzvg2A9xYAiAdEGwAHoXaA+bMdQD1hWgB2+OqADpgN8Bav/1qANzA+F8C7FDQCvAG8EeAOi7UCcMvi1edWwB36bN2+u2kE/BF3YiZ1sQ3wZ3AeHy9qSmoDfNgvA/zpDzChQrwmgP7sgA74EQCX1ULA51cLAR/fLASsLssAD18vA2iH5UWAu10HdMD/CAA8RzqgAzrg2QDaA2wRQHuALQJoD7BFAO1/9VwA3PWtAqibSQBG/rIAuBkBoH9yFQCOnTwr4LiNAdD1vAIAfigRAHpa/WcA6loIMAcTKwBgWAgB5tRHFWBaRQDrcy1grY9bhABzcKUOQK1MFrA5BAD7IAGAwoaA210MAO5TAgBHXALA3WWQAN3vwZgUAqZVAPjhHAEYa5R3sgEAuKm+l4AP+ygAROZPMiAA3Z05AL4CwP0NeFO2A45b8P30xyMQgKvKMkA7HOrDb+8uAoDRawBPX2nZfOMP+uB3cJo9AVBXwZLyfi8A63M1YGAJ7Tf6zZcB3jPbee0Z0DQX4NwJDQDkGABOrwVgfU4BIH4A+MvvBcAfEXBxDQDyJgHTz05JgHwrTXC2XAMefi4B3sFe36AAqAQJOH4rAVDZj7r4bn/WAuBoowCM1wFAP+fzq4H4xFvA4E59OsBxGwIgYxuazv2R1lAoAI5vfqBu9jMBcEoy8S6QKgCc71tTH/O5AJjIqfPnXMD4L70nf4y9R7MOEIQO6IAO6IAO6IAvDPju+2WA8TIuA1w9QsR2wPoM+tMSgE70nABjP+sAB9BKOVqTFgDQlpM6ZZEF4AnrRQB9CY+3LQDgAbvYSfwKADgsaGfMxNG3AgBPhU3oNNAGUPfx7S+Jo29lAFiTwHLSAoAjkmt4dV7kvRp1gONWL5Pub6KHOIsAWJ/ohdqn1+Gp2UrA8P13+ubLc+qVZ3kAPYveBKAvBEj8Rxj1ALg8F0DP47vV8hwAPYzeBECLxd9/qT/jvbkAQIODtvwMib5UAIDBYfpKYxLtqAAAgwMYr5KvzisAtBxta24CoEcs/y8RZgFsX07WYQlgh6P0f8hSALgxHS62AHCbCzz52wDF0AEd0AEd0AEd0AEd0AEd0AH/d4CU6awD6gCwyG0CwOLSvGhoMSBlPqwBQEkaAOaFTuaF4yn7Yxlgzm01AeAHApL2xwzAuAhN9s3CLYD7G/sKvqQBswjQhh8wxzYAwPy7xpcWsveM1QOUALW55LgdkgbMHAASmZPQ0bfQlQHqlzYZPb0I3w9dA9C+K78A45n2aUv/R7xJgC4+vpf+ssr9V8BZgA8NgDV7l2bK9JUBGG+lExa+sjdTgPFW+tuv5I1agHkhKVqia1syA6AZegUZqW2IDABW5GkV+KhVA8CK/PQCOLXtiAFAjp9e+9czzAWAHI9b4NRKkUtrgpSaUy0EDjAvRZ1m1CEHrLETGg/ZBoAZmOtH1ADQEDqgA3T4N3vfvg/NfncuAAAAAElFTkSuQmCC",
      "imageUrl": "",
      "headerData": {
        "header1": "Youtube Cafe",
        "header2": "Tempat nonton youtube gratis",
        "header3": "Jl. Antah berantah No.99, Jakarta",
        "header4": "Telp/WA: 08xx xxxx xxxx",
        "header5": "Website: youtube.com/idekorslet"
      },
      "transactionData": {
        "date": "28/10/2023 12:10:50",
        "trxID": "2810231210500099",
        "cashierName": "Yuli",
        "items": [
          {
            "itemName": "Pizza",
            "itemPrice": "25.000",
            "qty": "1",
            "discountName": "Discount 10%",
            "discountAmount": "2.500",
          },
          {
            "itemName": "Salad",
            "itemPrice": "15.000",
            "qty": "1",
            "discountName": "",
            "discountAmount": "0",
          },
          {
            "itemName": "Coffee",
            "itemPrice": "45.000",
            "qty": "3",
            "discountName": "Discount 5.000",
            "discountAmount": "5.000",
          }
        ],
        "subTotal": "85.000",
        "discountTotal": "7.500",
        "taxTotal": "7.750", //  PPN 10% = (subTotal - discountTotal) * 0.10
        "total": "85.250",
        "paymentType": "CASH",
        "payAmount": "100.000",
        "change": "14.750",
      },
      "footerData": {
        "footer1": "Terima kasih Atas Kunjungan Anda",
        "footer2": "Sampai Jumpa Lagi"
      },
      "msg": "OK"
    };

    return invoiceData;
  }
}