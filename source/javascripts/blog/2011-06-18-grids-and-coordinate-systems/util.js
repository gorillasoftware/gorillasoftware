(function() {
  var COS30, COS60, PI30, PI60, SIN30, SIN60, SR3, root;
  root = typeof global !== "undefined" && global !== null ? global : window;
  SR3 = Math.sqrt(3);
  PI30 = Math.PI / 6;
  PI60 = Math.PI / 3;
  SIN30 = Math.sin(PI30);
  COS30 = Math.cos(PI30);
  SIN60 = Math.sin(PI60);
  COS60 = Math.cos(PI60);
  root.to_xy = function(s, u, v, w) {
    var R, h, r, x, xu, xv, xw, y, yu, yv, yw;
    r = SR3 * s / 6;
    R = SR3 * s / 3;
    h = SR3 * s / 2;
    xu = 0;
    yu = u * R;
    xv = -v * COS30 * R;
    yv = -v * SIN30 * R;
    xw = w * COS30 * R;
    yw = -w * SIN30 * R;
    x = xu + xv + xw;
    y = yu + yv + yw;
    return [x, y];
  };
  root.to_uvw = function(s, x, y) {
    var R, factor, h, offset, r, u, v, w;
    if (x === 0 && y === 0) {
      return [0, 0, 0];
    }
    r = SR3 * s / 6;
    R = SR3 * s / 3;
    h = SR3 * s / 2;
    u = Math.floor((R + y) / h);
    if (y > 0) {
      factor = -1;
      offset = r;
    } else {
      factor = 1;
      offset = R;
    }
    v = factor * (Math.floor((Math.cos(PI60 - (Math.atan(x / y))) * Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)) + offset) / h));
    if (y > 0) {
      factor = 1;
      offset = R;
    } else {
      factor = -1;
      offset = r;
    }
    w = factor * (Math.floor((Math.cos(2 * PI60 - (Math.atan(x / y))) * Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)) + offset) / h));
    return [u, v, w];
  };
  root.valid_w = function(u, v) {
    return [u - v, u - v + 1];
  };
}).call(this);
