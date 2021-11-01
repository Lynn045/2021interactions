import processing.video.*;
Movie movie;

/*#FAF6A7 #FCF44F #FCD44F #FAA926 #2C200D */
color[]c={#FAF6A7,#FCF44F,#FCD44F,#FAA926,#2C200D};
int now=0;
void setup(){
    size(640,480);
    background(#F0F0F0);
    movie = new Movie(this,"123.mov");
    movie.play();
}
void draw(){
  if (movie.available()) {
    movie.read();
    image(movie,0,0);
  }
}
void mousePressed(){
    movie.pause();
    loadPixels();
    for(int i=0;i<640*480;i++){
      float bright = brightness(pixels[i]);//255
      int now =4-int(bright/67);
      pixels[i] = c[now];
    }
    updatePixels();
}
