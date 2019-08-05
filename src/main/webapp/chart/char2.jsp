<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head><meta charset="utf-8" /></head>
    <body>
        
        <script type="text/javascript" src="plotlyjs-bundle.js"></script>
            
            
        <script type="text/javascript" src="figure.js"></script>
        
        <div id="7b84aa4d-6ac0-40c9-b5b0-507cdf640782" style="width: 840px; height: 630px;" class="plotly-graph-div"></div>
        <script type="text/javascript">
            (function(){
                window.PLOTLYENV={'BASE_URL': 'https://plot.ly'};

                var gd = document.getElementById('7b84aa4d-6ac0-40c9-b5b0-507cdf640782')
                var resizeDebounce = null;

                function resizePlot() {
                    var bb = gd.getBoundingClientRect();
                    Plotly.relayout(gd, {
                        width: bb.width,
                        height: bb.height
                    });
                }
                Plotly.plot(gd,  {
                    data: figure.data,
                    layout: figure.layout,
                    frames: figure.frames,
                    config: {"showLink": true, "linkText": "Export to plot.ly", "mapboxAccessToken": "pk.eyJ1IjoiY2hyaWRkeXAiLCJhIjoiY2lxMnVvdm5iMDA4dnhsbTQ5aHJzcGs0MyJ9.X9o_rzNLNesDxdra4neC_A"}
                });
                
           }());
        </script>
    </body>
</html>
