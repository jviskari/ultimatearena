

class TileStack
{
    final int stackSize = 16;
    PApplet m_view;  
    TileSet m_tileset;
    int [] m_stack;
    int m_tilesize;
    int m_numTiles;
    int m_posx;
    int m_posy;
    
    TileStack(TileSet tileset, int posx, int posy, PApplet view)
    {
        m_tileset = tileset;
        m_tilesize = m_tileset.getTileSize();
        m_numTiles = m_tileset.getNumTiles();
        m_stack = new int[stackSize];
        m_posx = posx;
        m_posy = posy;    
        m_view = view;
    }  
    
    void update(int activeTile)
    {
        /** put active tile on the middle and handle rollover **/
        for(int x = 0; x < stackSize; x++)
        {
          println(x, activeTile);
          m_view.image(m_tileset.getTile(activeTile+x), m_posx+m_tilesize*x, m_posy,m_tilesize,m_tilesize);           
        }
      
    }
  
}
