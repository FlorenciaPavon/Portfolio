  // Email input interaction
$('.email').on("change keyup paste", function(){
    if($(this).val()){
        $('.icon-paper-plane').addClass("next");
    } else {
        $('.icon-paper-plane').removeClass("next");
    }
  });
  
  // Hover effect on buttons
  $('.next-button').hover(function(){
    $(this).css('cursor', 'pointer');
  });
  
  // Click action for email next button
  $('.next-button.email').click(function(){
    console.log("Something");
    $('.email-section').addClass("fold-up");
    $('.password-section').removeClass("folded");
  });

   
  // User input interaction
$('.user').on("change keyup paste", function(){
  if($(this).val()){
      $('.icon-lock').addClass("next");
  } else {
      $('.icon-lock').removeClass("next");
  }
});

// Click action for user next button
$('.next-button.user').click(function(){
  console.log("Something");
  $('.user-section').addClass("fold-up");
  $('.password-section').removeClass("folded");
});
  
  
  // Password input interaction
  $('.password').on("change keyup paste", function(){
    if($(this).val()){
        $('.icon-lock').addClass("next");
    } else {
        $('.icon-lock').removeClass("next");
    }
  });
  
  // Click action for password next button
  $('.next-button.password').click(function(){
    console.log("Something");
    $('.password-section').addClass("folded");
    $('.repeat-password-section').removeClass("folded");
  });

  
  // Click action for repeat password next button
  
  $('.next-button.password').click(function(){
    console.log("Something");
    $('.password-section').addClass("folded");
    $('.repeat-password-section').removeClass("folded");    
    $('.success').css("marginTop", 0);
});

 