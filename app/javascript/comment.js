document.addEventListener('turbo:load', () => {
    $(".comment-form-display").click(function(){
      // $(this).parent()
      $parent = $(this).parent()
      $parent.find('.comment-form').css("display", "block")
      $parent.find('.comment-form-close').css("display", "block")
      $parent.find('.comment-form-display').css("display", "none")
    });

    $(".comment-form-close").click(function(){
      $parent = $(this).parent()
      $parent.find('.comment-form').css("display", "none");
      $parent.find('.comment-form-close').css("display", "none")
      $parent.find('.comment-form-display').css("display", "block")
    });
})
