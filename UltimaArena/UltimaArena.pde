
void setup()
{
    size(1024,512);
    frameRate(50);    
    tileset = new TileSet(TILEFILE, TILES_X, TILES_Y, TILESIZE);
    
    map = new Map(tileset,32,32);
    map.setView(this);
    tilestack = new TileStack(tileset, (width/2)-4*TILESIZE, height-TILESIZE, this);
}
