//double size
final int TILESIZE = 32;
final int TILES_X = 32;
final int TILES_Y = 16;
final String TILEFILE = "data/u5.png";

//final int TILESIZE = 16;
//final int TILES_X = 32;
//final int TILES_Y = 16;
//final String TILEFILE = "data/u5pc.png";
//final String TILEFILE = "data/u5a.png";
//final String TILEFILE = "data/u5bw.png";

File file;
TileSet tileset;
Map map;
TileStack tilestack;

void draw()
{ 
    stroke(255,0,0);
    noFill();
    background(0);

    map.render();
    map.selectTileAt(mouseX, mouseY); 
    tilestack.update(map.getActiveTile());
    
}
