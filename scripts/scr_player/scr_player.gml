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
    if (place_meeting(x + dx, y, tilemap))
    {
        while (!place_meeting(x + dx, y, tilemap)) 
        {
    	    x = x + dx;
        }
    dx = 0 
    }
       
    // left and right movement 
     x = x + dx;
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function applyGravity()
{ 
    dy += grv;
    
    if (place_meeting(x, y + dy, tilemap))
    {
        while (!place_meeting(x, y + dy, tilemap)) 
        {
            y = y + sign(dy)	
        }
    dy = 0;
    }
    
    y += dy; 
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------
function standStateFunction()
{
    show_debug_message("standStateFunction")
    sprite_index = s_player_idle_right;
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
    sprite_index = s_player_walk_right

    // states
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
    
    // sprites
     sprite_index = s_player_jump_right
    
    //states
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
    if (dy == 0)
    {
        playerState = playerStates.stand;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------