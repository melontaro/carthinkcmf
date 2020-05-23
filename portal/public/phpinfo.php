<?php

class car{
     private $id=0;
     private $name="";
/*
 * @param int $id
 */public function setId($id)
{
    $this->id = $id;
}
public function getId(){
     return $this->id;
}
public function setName($name){
     $this->name=$name;
}
public function getName()
{
   return $this->name;
}

}
$car1=new car();
$car1->setId(1);
$car1->setName('哈哈');
$arryTest['1']=[$car1,'tewer','sdfa','蛤蛤蛤'];
echo $arryTest['1'][0]->getName();
foreach($arryTest as $key => $value){

    //echo "{$key}==>{$value}<br>";
}

phpinfo();