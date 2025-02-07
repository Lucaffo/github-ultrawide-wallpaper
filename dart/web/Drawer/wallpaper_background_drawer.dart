import 'dart:html';
import 'dart:convert';

import 'wallpaper_drawer.dart';

/*
*   Wallpaper Logo Background Class.
*   This is responsible for drawing the background of the canvas.
*
*   Luca Raffo @ 04/02/2025
*/ 
class WallpaperBackgroundDrawer extends WallpaperDrawer {

    String color;
    String? src;

    WallpaperBackgroundDrawer ({
      required this.color, 
      this.src
    });

    factory WallpaperBackgroundDrawer.fromRawJson(String str) => WallpaperBackgroundDrawer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WallpaperBackgroundDrawer.fromJson(Map<String, dynamic> json) => WallpaperBackgroundDrawer(
        color: json["color"],
        src: json["src"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "src": src,
    };
    
    @override
    Future draw(CanvasRenderingContext2D ctx) async
    {
      CanvasElement tempCanvas = CanvasElement(width: ctx.canvas.width, height: ctx.canvas.height);
      CanvasRenderingContext2D tempCtx = tempCanvas.context2D;

      tempCtx.fillStyle = color;
      tempCtx.fillRect(0, 0, tempCanvas.width!, tempCanvas.height!);
      
      ctx.drawImageScaled(tempCanvas, 0, 0, ctx.canvas.width!, ctx.canvas.height!);
    }
}
