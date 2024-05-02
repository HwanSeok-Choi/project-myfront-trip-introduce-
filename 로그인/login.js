let flag = 0; 

$(document).ready( function(){

    $(".signin").on( "click", function(){
          if(flag == 0){
    $(".move").addClass("moving");
    $(".move").removeClass("start");
    
    $(".form").addClass("movingForm");
    $(".form").removeClass("startForm");
    
    $(".hello").show();
    $(".welcome").hide();
    
    
    $(".move").css("background-position", "right");
    
    setTimeout(function(){
      $(".title").text("계정 만들기");
      $(".light").text("또는 이메일을 사용하여 등록하세요.");
      $(".name").hide();
      $(".p-button").text("SIGN IN");
      $(".b-button").text("SIGN UP");
      $(".forgot").show();
      $(".form").css("border-radius","10px 0px 0px 10px");
      $(".move").css("border-radius","0px 10px 10px 0px");
    }, 200);
    
    flag=1;
  }else{
    $(".move").removeClass("moving");
    $(".move").addClass("start");
    
    $(".form").removeClass("movingForm");
    $(".form").addClass("startForm");
    
    
    $(".hello").hide();
    $(".welcome").show();
    
    $(".move").css("background-position", "left");
    
    setTimeout(function(){
      $(".title").text("Create Account");
      $(".light").text("Or use your email for registration");
      $(".name").show();
      $(".p-button").text("SIGN UP");
      $(".b-button").text("SIGN IN");
      $(".forgot").hide();
      $(".form").css("border-radius","0px 10px 10px 0px");
      $(".move").css("border-radius","10px 0px 0px 10px");
    }, 200);
    
    flag=0;
    
  }

  
    });
});