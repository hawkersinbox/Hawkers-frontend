



class Payment{
  String  UserName;
  String  RequestID;
  String  PaymentID;
  String  Amount;
  String  Mode;
  String  Date;
  String  Status;
  Payment({
    this.UserName,
    this.RequestID,
    this.PaymentID,
    this.Amount,
    this.Mode,
    this.Date,

    this.Status,
});
  static List<Payment> getPaymentDetails(){
    return <Payment>[
      Payment(
        UserName: "varun",
        RequestID: "1423",
        PaymentID: "Ed524657",
        Amount: "3400",
        Mode: "Paytm",
        Date: "22/07/2019",
        Status: "Inprogress"

      ),
      Payment(
          UserName: "varun",
          RequestID: "1423",
          PaymentID: "Ed524657",
          Amount: "3400",
          Mode: "Paytm",
          Date: "22/07/2019",
          Status: "Inprogress"

      ),
      Payment(
          UserName: "varun",
          RequestID: "1423",
          PaymentID: "Ed524657",
          Amount: "3400",
          Mode: "Paytm",
          Date: "22/07/2019",
          Status: "Inprogress"

      ),
      Payment(
          UserName: "varun",
          RequestID: "1423",
          PaymentID: "Ed524657",
          Amount: "3400",
          Mode: "Paytm",
          Date: "22/07/2019",
          Status: "Inprogress"

      ),
      Payment(
          UserName: "varun",
          RequestID: "1423",
          PaymentID: "Ed524657",
          Amount: "3400",
          Mode: "Paytm",
          Date: "22/07/2019",
          Status: "Inprogress"

      ),

    ];

  }
}