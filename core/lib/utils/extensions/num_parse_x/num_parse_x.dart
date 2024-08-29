extension NumParseX on Comparable {
  double? doubleParser(){
   if(this is double){
     return this as double;
   }
   else if(this is int){
    final parsed = this as int;// double.tryParse(toString());
     return parsed.toDouble();
   }
   else if(this is num){
     final parsed = this as num;
     return parsed.toDouble();
   }
   else if(this is String){
    return double.tryParse(this as String);
   }
   // return this ;
  }
}
