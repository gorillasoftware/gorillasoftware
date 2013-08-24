(function() {
  ($(document)).ready(function() {
    var R, apex, c, coordinates, faces, fieldSize, h, height, offset, paper, path, r, sideLength, totalCoordinates, triangle, triangles, u, uS, uSet, upright, uvw, v, vS, vSet, validCoordinates, w, wS, wSet, width, x, xOffset, y, yOffset, _base, _i, _len, _ref, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
    sideLength = 80;
    width = ($('#paper')).width();
    height = ($('#paper')).height();
    xOffset = width / 2;
    yOffset = height / 2;
    fieldSize = 7;
    triangles = {};
    uS = [];
    vS = [];
    wS = [];
    $('#paper').mousemove(function(e) {
      var adj, t, u, uSet, u_, v, vSet, v_, w, wSet, w_, x, y, _i, _j, _k, _len, _len2, _len3, _ref, _ref2, _ref3, _ref4;
      x = e.pageX - xOffset - $('#paper').offset().left;
      y = e.pageY - yOffset - $('#paper').offset().top;
      faces.attr({
        fill: 'none',
        stroke: 'black'
      });
      _ref = to_uvw(sideLength, x, y), u = _ref[0], v = _ref[1], w = _ref[2];
      uSet = uS[u];
      if (uSet != null) {
        uSet.attr({
          fill: 'darkred'
        });
      }
      vSet = vS[v];
      if (vSet != null) {
        vSet.attr({
          fill: 'darkblue'
        });
      }
      wSet = wS[w];
      if (wSet != null) {
        wSet.attr({
          fill: 'darkgreen'
        });
      }
      t = ((triangles[u] || {})[v] || {})[w];
      _ref2 = [-1, 0, 1];
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        u_ = _ref2[_i];
        _ref3 = [-1, 0, 1];
        for (_j = 0, _len2 = _ref3.length; _j < _len2; _j++) {
          v_ = _ref3[_j];
          _ref4 = [-1, 0, 1];
          for (_k = 0, _len3 = _ref4.length; _k < _len3; _k++) {
            w_ = _ref4[_k];
            adj = ((triangles[u + u_] || {})[v + v_] || {})[w + w_];
            if (adj == null) {
              continue;
            }
            adj.attr({
              fill: "blue"
            });
            adj.toFront;
          }
        }
      }
      if (t != null) {
        t.attr({
          fill: "red"
        });
        t.toFront();
      }
      coordinates.toFront();
      ($('#xy')).html("" + x + ", " + y);
      return ($('#uvw')).html("" + u + " , " + v + ", " + w);
    });
    paper = Raphael("paper", "100%", "100%");
    r = (Math.sqrt(3)) * sideLength / 6;
    R = (Math.sqrt(3)) * sideLength / 3;
    h = (Math.sqrt(3)) * sideLength / 2;
    totalCoordinates = 0;
    validCoordinates = 0;
    coordinates = paper.set();
    faces = paper.set();
    for (v = _ref = -fieldSize; _ref <= fieldSize ? v <= fieldSize : v >= fieldSize; _ref <= fieldSize ? v++ : v--) {
      for (w = _ref2 = -fieldSize; _ref2 <= fieldSize ? w <= fieldSize : w >= fieldSize; _ref2 <= fieldSize ? w++ : w--) {
        _ref3 = [1 - v - w, -v - w];
        for (_i = 0, _len = _ref3.length; _i < _len; _i++) {
          u = _ref3[_i];
          totalCoordinates++;
          validCoordinates++;
          _ref4 = to_xy(sideLength, u, v, w), x = _ref4[0], y = _ref4[1];
          x += xOffset;
          y += yOffset;
          c = paper.circle(x, y, 1);
          c.attr({
            fill: 'red',
            stroke: 'none'
          });
          upright = (u + v + w) % 2 === 0;
          if (upright) {
            path = ["M", x, y - R, "L", x + sideLength / 2, y + r, "L", x - sideLength / 2, y + r, "Z"];
            apex = Math.round(x) + "/" + Math.round(y + v * r);
          } else {
            path = ["M", x, y + R, "L", x + sideLength / 2, y - r, "L", x - sideLength / 2, y - r, "Z"];
            apex = Math.round(x) + "/" + Math.round(y + v * r + r);
          }
          uSet = ((_ref5 = uS[u]) != null ? _ref5 : uS[u] = paper.set());
          vSet = ((_ref6 = vS[v]) != null ? _ref6 : vS[v] = paper.set());
          wSet = ((_ref7 = wS[w]) != null ? _ref7 : wS[w] = paper.set());
          triangle = paper.path(path);
                    if ((_ref8 = triangles[u]) != null) {
            _ref8;
          } else {
            triangles[u] = {};
          };
                    if ((_ref9 = (_base = triangles[u])[v]) != null) {
            _ref9;
          } else {
            _base[v] = {};
          };
          triangles[u][v][w] = triangle;
          uSet.push(triangle);
          vSet.push(triangle);
          wSet.push(triangle);
          faces.push(triangle);
          offset = upright ? sideLength / 6 : -sideLength / 6;
          uvw = paper.text(x, y + offset, "" + u + "/" + v + "/" + w);
          coordinates.push(uvw);
          uvw.attr({
            fill: "white",
            'font-size': sideLength / 6,
            'text-anchor': "middle"
          });
        }
      }
    }
    faces.attr({
      'stroke-width': 1
    });
    return faces.toBack;
  });
}).call(this);
