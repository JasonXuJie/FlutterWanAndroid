class ObjectUtil{

  static bool isEmptyString(String str){
    return str == null || str.isEmpty;
  }

  static bool isEmptyList(Iterable list){
    return list == null || list.isEmpty;
  }

  static bool isEmptyMap(Map map){
    return map == null || map.isEmpty;
  }

  static bool isEmpty(Object object){
    if(object ==  null)  return  true;
    if(object is String && object.isEmpty){
      return true;
    }else if(object is Iterable && object.isEmpty){
      return true;
    }else if(object is Map  && object.isEmpty){
      return true;
    }
    return false;
  }

  static bool isNotEmpty(Object object){
    return !isEmpty(object);
  }

  static bool twoListIsEqual(List listA,List listB){
    if(listA == listB) return true;
    if(listA == null || listB == null) return false;
    int length =  listA.length;
    if(length != listB.length) return false;
    for(int  i = 0;i<length;i++){
      if(!listA.contains(listB[i])){
        return false;
      }
    }
    return true;
  }

  static  int getLength(Object value){
    if(value == null) return 0;
    if(value is String){
      return value.length;
    }else if(value is Iterable){
      return value.length;
    }else if(value is Map){
      return value.length;
    }else{
      return 0;
    }
  }

}