function inputCheck()
{
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    jump = keyboard_check_pressed(ord("W"));
    
    move = right - left;
    
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function movement()
{
    // horizontal movement
    dx = move * PlayerValues.walkSpeed; // show_debug_message(string(dx))
    
    // jump
    if (jump && place_meeting(x, y + 1, tilemap))
    {
        dy -= PlayerValues.jump
    }
    
    // collision horizontal
    if (place_meeting(x + sign(dx), y, tilemap))
    {
        while (!place_meeting(x + sign(dx), y, tilemap)) 
        {
    	    x += sign(dx)+1;
        }
    dx = 0 
    }
       
    // left and right movement 
     x += dx;
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function applyGravity()
{ 
    dy += grv;
    
    if (place_meeting(x, y + sign(dy), tilemap))
    {
        while (!place_meeting(x, y + sign(dy), tilemap)) 
        {
            y += sign(dy)
        }
    dy = 0;
    }
    
    y += dy; 
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function standStateFunction()
{
    show_debug_message("standStateFunction")
    
    // sprite
    sprite_index = s_player_idle;
    
    // state
    if (dx == PlayerValues.walkSpeed || dx == -PlayerValues.walkSpeed)
    {
        playerState = playerStates.walk;
    }
    if (dy < 0)
    {
        playerState = playerStates.jump;
    }
    if (dy > 0)
    {
        playerState = playerStates.fall;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function walkStateFunction()
{
    show_debug_message("walkStateFunction")
    
    // sprite
    sprite_index = s_player_walk;

    // state
    if (dy < 0)
    {
        playerState = playerStates.jump;
    }
    if (dx == 0)
    {
        playerState = playerStates.stand;
    }
    if (dx > 0)
    {
        image_xscale = playerScaleX;
    }
    else if (dx < 0)
    {
        image_xscale = -playerScaleX;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function jumpStateFunction()
{
    show_debug_message("jumpStateFunction")
    
    // sprite
     sprite_index = s_player_jump;
    
    // state
    if (dy > 0)
    {
        playerState = playerStates.fall;
    }
        if (dx > 0)
    {
        image_xscale = playerScaleX;
    }
    else if (dx < 0)
    {
        image_xscale = -playerScaleX;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function fallStateFunction()
{
    
    show_debug_message("fallStateFunction")
    
    // sprite
    // sprite_index = s_player_fall;
    
    // state
    if (dy == 0)
    {
        playerState = playerStates.stand;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------