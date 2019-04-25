$(document).ready(function() {
  var $newCommentButton = $("#new-comment-btn");
  var $commentsDiv = $("comments-div");

  $newCommentButton.on("click", function() {
    event.preventDefault();
    var $newComment = $(`
    <div>
      <big>Tim Kepple</big>
      <small class="muted">The Time</small>
      <p>New comment.</p>
    </div>`).hide(); 
    console.log("click")
    $commentsDiv.append($newComment.fadeIn());
  });
});