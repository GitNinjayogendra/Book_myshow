<html>
<head>
<script>
$(document).ready(function(){
  $("card").click(function(){
    $("div:card-body").addClass("intro");
  });
});
</script>
<style>
.intro {
  font-size: 150%;
  color: red;
}
</style>
</head>
</html>