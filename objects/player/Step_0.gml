inputCheck();
movement();
applyGravity();


switch (playerState) {
	case playerStates.stand:
        standStateFunction();
        break;
    case playerStates.walk:
        walkStateFunction();
        break;
    case playerStates.jump:
        jumpStateFunction();
        break;
    case playerStates.fall:
        fallStateFunction();
        break;
    case playerStates.run:
        runStatFunction()
}