function aim(controllerAction, fire) {
  $(function(){
    var currentController = $("body").data("cntl");
    var currentAction = $("body").data("act");

    if (typeof controllerAction === "string") {
      var splitOption = controllerAction.split("#");

      if (splitOption[0] != currentController || splitOption[1] != currentAction) {
        return;
      }

      fire();
    }
  });
}
