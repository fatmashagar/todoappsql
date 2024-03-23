class todo{
  String? id;
  String? todotext;
  bool isdone;
  todo({
    required this.id,required this.todotext,  this.isdone=false
  });

  static List<todo> todolist(){
    return [
      todo(id: "01", todotext: "صلاه الفجر",isdone: true),
      todo(id: "02", todotext: "قراءه قرءان",),
      todo(id: "03", todotext: "مذاكره",),
      todo(id: "04", todotext: "اروح الخمروبه",),
      todo(id: "05", todotext: "انام",),
      todo(id: "06", todotext: "اصحي افطر",),
      todo(id: "07", todotext: "العشا والتراويح",),

    ];
  }}