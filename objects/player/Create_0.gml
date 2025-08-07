enum playerStates
{
    stand,
    jump,
    fall,
    walk,
    run
}

PlayerValues =
{
    walkSpeed : 3,
    runSpeed : 4,
    jump : 6.7,
}

dx = 0;
dy = 0;
grv = 0.3;

tilemap = layer_tilemap_get_id("Tiles_Coll");

playerState = playerStates.stand;
playerScaleX = image_xscale;

canDoubleJump = true;
doubleJumpUsed = false; 
