class Account {
  String platform;
  String type;
  String service;
  String hostname;
  String accountid;
  String description;
  String passwordchangedate;
  String passwordchangeinterval;
  String owner;
  String team;
  String activepassword;
  String passwordversion1;
  String passwordversion2;
  bool mfa;
  String mfamethod;
  String remark;
  String submitdate;
  String submitby;
  String modifydate;
  String modifyby;
  String status;
  String decommssiondate;

  Account(
      {this.platform,
      this.type,
      this.service,
      this.hostname,
      this.accountid,
      this.description,
      this.passwordchangedate,
      this.passwordchangeinterval,
      this.owner,
      this.team,
      this.activepassword,
      this.passwordversion1,
      this.passwordversion2,
      this.mfa,
      this.mfamethod,
      this.submitdate,
      this.submitby,
      this.modifydate,
      this.modifyby,
      this.remark,
      this.status,
      this.decommssiondate});

  Account.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    type = json['type'];
    service = json['service'];
    hostname = json['hostname'];
    accountid = json['accountid'];
    description = json['description'];
    passwordchangedate = json['passwordchangedate'];
    passwordchangeinterval = json['passwordchangeinterval'];
    owner = json['owner'];
    team = json['team'];
    activepassword = json['activepassword'];
    passwordversion1 = json['passwordversion1'];
    passwordversion2 = json['passwordversion2'];
    mfa = json['mfa'];
    mfamethod = json['mfamethod'];
    remark = json['remark'];
    submitdate = json['submitdate'];
    submitby = json['submitby'];
    modifydate = json['modifydate'];
    modifyby = json['modifyby'];
    status = json['status'];
    decommssiondate = json['decommssiondate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['type'] = this.type;
    data['service'] = this.service;
    data['hostname'] = this.hostname;
    data['accountid'] = this.accountid;
    data['description'] = this.description;
    data['passwordchangedate'] = this.passwordchangedate;
    data['passwordchangeinterval'] = this.passwordchangeinterval;
    data['owner'] = this.owner;
    data['team'] = this.team;
    data['activepassword'] = this.activepassword;
    data['passwordversion1'] = this.passwordversion1;
    data['passwordversion2'] = this.passwordversion2;
    data['mfa'] = this.mfa;
    data['mfamethod'] = this.mfamethod;
    data['remark'] = this.remark;
    data['submitdate'] = this.submitdate;
    data['submitby'] = this.submitby;
    data['modifydate'] = this.modifydate;
    data['modifyby'] = this.modifyby;
    data['status'] = this.status;
    data['decommssiondate'] = this.decommssiondate;
    return data;
  }
}
