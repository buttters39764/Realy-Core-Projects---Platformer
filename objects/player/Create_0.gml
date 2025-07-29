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
    jump : 5
}

dx = 0;
dy = 0;
grv = 0.3;

tilemap = layer_tilemap_get_id("Tiles_1");

playerState = playerStates.stand;
playerScaleX = image_xscale;