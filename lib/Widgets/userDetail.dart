
class userD{
  String UserName;
  String Role;
  String Status;

  userD({
    this.UserName,
    this.Role,
    this.Status
});
  static List<userD> getUserDetail(){
    return <userD>[
      userD(
        UserName: "Varun",
        Role: "developer",
        Status: "Active"
      ),
      userD(
          UserName: "Varun",
          Role: "developer",
          Status: "Active"
      ),
      userD(
          UserName: "Varun",
          Role: "developer",
          Status: "Active"
      ),
      userD(
          UserName: "Varun",
          Role: "developer",
          Status: "Active"
      ),
      userD(
          UserName: "Varun",
          Role: "developer",
          Status: "Active"
      )
    ];
  }
}