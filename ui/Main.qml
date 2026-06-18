import QtQuick

Window {
    id: root
    width: 1200
    height: 700
    visible: true
    title: "Learning Qt Canvas"

    property real amplitude: 100
    property real frequency: 1
    property real phase: 0

    Canvas {
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");

            // clear rect
            ctx.clearRect(0, 0, width, height);

            // draw background
            ctx.fillStyle = "#202020";
            ctx.fillRect(0, 0, width, height);

            // draw grid
            drawGrid(ctx);
            drawAxis(ctx);
            drawSin(ctx);
        }

        function drawGrid(ctx) {
            ctx.strokeStyle = "#333333";
            ctx.lineWitdh = 1;

            var step = 50;

            // draw vertical grid
            for (var x = 0; x < width; x += step) {
                ctx.beginPath();
                ctx.moveTo(x, 0);
                ctx.lineTo(x, height);
                ctx.stroke();
            }

            // draw horizontal grid
            for (var y = 0; y < height; y += step) {
                ctx.beginPath();
                ctx.moveTo(0, y);
                ctx.lineTo(width, y);
                ctx.stroke();
            }
        }

        function drawAxis(ctx) {
            ctx.strokeStyle = "#888888";
            ctx.lineWidth = 1;

            // draw Oy axis
            ctx.beginPath();
            ctx.moveTo(50, 0);
            ctx.lineTo(50, height);
            ctx.stroke();

            // drwa Ox axis
            ctx.beginPath();
            ctx.moveTo(50, height / 2);
            ctx.lineTo(width, height / 2);
            ctx.stroke();
        }

        function drawSin(ctx) {
            ctx.strokeStyle = "#00ff99";
            ctx.lineWidth = 3;

            var centerY = height / 2;
            var scaleX = 0.02;

            ctx.beginPath();
            for (var x = 50; x < width; x++) {
                var t = x * scaleX;
                var y = centerY - root.amplitude * Math.sin(2 * Math.PI * root.frequency * t + root.phase);

                if (x == 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();
        }
    }
}
