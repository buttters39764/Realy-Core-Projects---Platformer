enum playerStates
{
    stand,
    jump,
    fall,
    walk
}

PlayerValues =
{
    walkSpeed : 2, 
    jump : 6,
    jumpCount : 0,
    maxJumps: 1
}

dx = 0;
dy = 0;
grv = 0.3;

tilemap = layer_tilemap_get_id("Tiles_Coll");

playerState = playerStates.stand;
playerScaleX = image_xscale;