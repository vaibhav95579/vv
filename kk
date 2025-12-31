<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For My Kuchu ❤️</title>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        /* --- VARIABLES & RESET --- */
        :root {
            --bg-gradient: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            --deep-red: #ff4d6d;
            --text-color: #59302d;
            --glass: rgba(255, 255, 255, 0.5);
            --glass-border: rgba(255, 255, 255, 0.6);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%);
            min-height: 100vh;
            font-family: 'Nunito', sans-serif;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        /* --- FIREWORKS & RAIN CANVAS --- */
        #canvas {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; pointer-events: none;
        }

        /* --- UI CONTAINER --- */
        .container {
            position: relative;
            z-index: 10;
            width: 90%;
            max-width: 420px;
            height: 680px;
        }

        .card {
            background: var(--glass);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 2px solid var(--glass-border);
            border-radius: 30px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            width: 100%;
            height: 100%;
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: all 0.5s ease-in-out;
            position: absolute;
            top: 0; left: 0;
            opacity: 0;
            pointer-events: none;
            transform: scale(0.9) translateY(20px);
        }

        .card.active {
            opacity: 1;
            pointer-events: all;
            transform: scale(1) translateY(0);
        }

        /* --- TYPOGRAPHY --- */
        h1 {
            font-family: 'Fredoka One', cursive;
            color: var(--deep-red);
            font-size: 1.8rem;
            margin-bottom: 15px;
            text-shadow: 1px 1px 0 rgba(255,255,255,0.8);
        }

        p {
            color: var(--text-color);
            font-size: 1.1rem;
            line-height: 1.5;
            margin-bottom: 20px;
            font-weight: 700;
        }

        /* --- SLIDESHOW --- */
        .slideshow-container {
            width: 100%; height: 200px; position: relative; margin-bottom: 15px;
            border-radius: 20px; overflow: hidden; box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            background: rgba(255,255,255,0.3);
        }
        .mySlides { display: none; width: 100%; height: 100%; }
        .mySlides img { width: 100%; height: 100%; object-fit: cover; }
        .fade { animation-name: fade; animation-duration: 1.5s; }
        @keyframes fade { from {opacity: .4} to {opacity: 1} }

        /* --- BUTTONS --- */
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
            align-items: center;
            margin-top: auto;
        }

        .btn {
            background: var(--deep-red);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 50px;
            font-family: 'Fredoka One', cursive;
            font-size: 1rem;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(255, 77, 109, 0.4);
            transition: transform 0.2s;
            position: relative;
        }
        .btn:hover { transform: scale(1.05); }

        /* The "No" button specific style */
        #noBtn {
            background: #a0a0a0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            font-size: 0.9rem;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }

        /* --- TEDDY CSS --- */
        .teddy-wrapper { transform: scale(0.7); margin: -20px 0 -10px 0; position: relative; z-index: 5; }
        .ear { position: absolute; width: 50px; height: 50px; background: #c68b59; border-radius: 50%; top: 0; border: 4px solid #a87346; }
        .ear.left { left: 5px; } .ear.right { right: 5px; }
        .ear::after { content: ''; position: absolute; width: 30px; height: 30px; background: #e0ac7e; border-radius: 50%; top: 6px; left: 6px; }
        .head { position: relative; width: 140px; height: 130px; background: #c68b59; border-radius: 50% 50% 45% 45%; border: 4px solid #a87346; z-index: 2; margin-top: 15px; }
        .eye { position: absolute; width: 16px; height: 16px; background: #333; border-radius: 50%; top: 45px; animation: blink 3s infinite; }
        .eye.left { left: 35px; } .eye.right { right: 35px; }
        .eye::after { content: ''; position: absolute; width: 6px; height: 6px; background: white; border-radius: 50%; top: 2px; right: 3px; }
        .snout { position: absolute; width: 50px; height: 40px; background: #e0ac7e; border-radius: 50%; top: 70px; left: 42px; }
        .nose { position: absolute; width: 20px; height: 16px; background: #4a2c2a; border-radius: 50% 50% 50% 50%; top: 5px; left: 15px; }
        .mouth { position: absolute; width: 24px; height: 12px; border-bottom: 3px solid #4a2c2a; border-radius: 0 0 50% 50%; top: 20px; left: 13px; }
        .blush { position: absolute; width: 25px; height: 15px; background: rgba(255, 100, 100, 0.2); border-radius: 50%; top: 75px; }
        .blush.left { left: 20px; } .blush.right { right: 20px; }
        
        @keyframes blink { 0%, 96%, 100% {transform: scaleY(1);} 98% {transform: scaleY(0.1);} }
        
        .sad .mouth { border-bottom: none; border-top: 3px solid #4a2c2a; top: 25px; } .sad .eye { top: 50px; }
        .happy .eye { animation: none; height: 8px; border-radius: 50% 50% 0 0; border: 3px solid #333; border-bottom: 0; background: transparent; } .happy .eye::after { display: none; }

        /* Floating Emoji Animation */
        .emoji-rain {
            position: fixed;
            top: -50px;
            font-size: 2rem;
            animation: fall linear forwards;
            z-index: 100;
        }
        @keyframes fall { to { transform: translateY(110vh) rotate(360deg); } }

    </style>
</head>
<body>

    <canvas id="canvas"></canvas>

    <div class="container">
        
        <div class="card active" id="step1">
            <div class="teddy-wrapper sad">
                <div style="position:relative; width:140px; margin:0 auto;">
                    <div class="ear left"></div><div class="ear right"></div>
                    <div class="head">
                        <div class="eye left"></div><div class="eye right"></div>
                        <div class="blush left"></div><div class="blush right"></div>
                        <div class="snout"><div class="nose"></div><div class="mouth"></div></div>
                    </div>
                </div>
            </div>
            <h1>I'm Sorry, Kuchu</h1>
            <p>I know I haven't been perfect. For every moment I made you sad this year, I am truly sorry. I love you.</p>
            <button class="btn" onclick="nextSlide(2)">But</button>
        </div>

        <div class="card" id="step2">
            <div class="teddy-wrapper">
                <div style="position:relative; width:140px; margin:0 auto;">
                    <div class="ear left"></div><div class="ear right"></div>
                    <div class="head">
                        <div class="eye left"></div><div class="eye right"></div>
                        <div class="blush left"></div><div class="blush right"></div>
                        <div class="snout"><div class="nose"></div><div class="mouth"></div></div>
                    </div>
                </div>
            </div>
            <h1>Thank You</h1>
            <p>Thank you for staying. Thank you for being my peace. I appreciate you more than words can say.</p>
            <button class="btn" onclick="nextSlide(3)">Click Kar Yaha</button>
        </div>

        <div class="card" id="step3">
            <div class="slideshow-container">
                <div class="mySlides fade"><img src="vg1.jpeg"></div>
                <div class="mySlides fade"><img src="vg2.jpeg"></div>
                <div class="mySlides fade"><img src="vg3.jpeg"></div>
            </div>
            <h1>My World</h1>
            <p style="font-size:0.95rem; font-style:italic;">"Kuchu, I am so emotionally attached to you. Imagining a day without you feels impossible. You are my everything."</p>
            <button class="btn" onclick="nextSlide(4)">Happy New Year</button>
        </div>

        <div class="card" id="step4">
            <div class="teddy-wrapper happy">
                <div style="position:relative; width:140px; margin:0 auto;">
                    <div class="ear left"></div><div class="ear right"></div>
                    <div class="head">
                        <div class="eye left"></div><div class="eye right"></div>
                        <div class="blush left"></div><div class="blush right"></div>
                        <div class="snout"><div class="nose"></div><div class="mouth"></div></div>
                    </div>
                </div>
            </div>
            <h1>Happy New Year!</h1>
            <p>Let's leave the bad behind. In 2026, I promise to love you harder and make you the happiest girl alive.</p>
            <button class="btn" onclick="nextSlide(5)">Aage click kar</button>
        </div>

        <div class="card" id="step5">
            <div class="teddy-wrapper">
                <div style="position:relative; width:140px; margin:0 auto;">
                    <div class="ear left"></div><div class="ear right"></div>
                    <div class="head">
                        <div class="eye left"></div><div class="eye right"></div>
                        <div class="blush left"></div><div class="blush right"></div>
                        <div class="snout"><div class="nose"></div><div class="mouth"></div></div>
                    </div>
                </div>
            </div>
            <h1 id="question-text">I Love You, Kuchu! ❤️</h1>
            <p>Do you love me back?</p>
            
            <div class="btn-group">
                <button class="btn" onclick="showerLove()">I love you too but infinite! 🥰</button>
                <button class="btn" id="noBtn" onclick="moveButton()">I don't love you 🙄</button>
            </div>
        </div>

    </div>

    <script>
        // --- NAVIGATION ---
        function nextSlide(step) {
            document.querySelectorAll('.card').forEach(c => c.classList.remove('active'));
            document.getElementById('step' + step).classList.add('active');
            
            // Start slideshow if entering step 3
            if(step === 3) showSlides(slideIndex);
        }

        // --- SLIDESHOW ---
        let slideIndex = 1;
        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) { slides[i].style.display = "none"; }
            slides[slideIndex-1].style.display = "block";
        }
        setInterval(() => { if(document.getElementById('step3').classList.contains('active')) { slideIndex++; showSlides(slideIndex); } }, 3000);

        // --- THE BUTTON GAME LOGIC ---
        let clickCount = 0;
        function moveButton() {
            clickCount++;
            const btn = document.getElementById('noBtn');
            const card = document.querySelector('#step5');
            
            // 1. Move the button randomly within the card
            // Calculate safe area (subtracting button size)
            const maxX = card.offsetWidth - btn.offsetWidth - 40;
            const maxY = card.offsetHeight - btn.offsetHeight - 40;
            
            const randomX = Math.random() * maxX;
            const randomY = Math.random() * maxY;

            btn.style.position = 'absolute';
            btn.style.left = randomX + 'px';
            btn.style.top = randomY + 'px';

            // 2. Change the text based on clicks
            if (clickCount === 1) {
                btn.innerText = "Are you sure? 😢";
            } else if (clickCount === 2) {
                btn.innerText = "No way please don't! 😭";
            } else if (clickCount === 3) {
                btn.innerText = "But I love you! 🥺";
            } else if (clickCount === 4) {
                btn.innerText = "Huh you love me ik 😏";
            } else if (clickCount === 5) {
                // Final Transformation
                btn.innerText = "I love you too infinite bubu ❤️";
                btn.style.background = "#ff4d6d"; // Change to Red
                btn.style.color = "white";
                btn.style.boxShadow = "0 5px 15px rgba(255, 77, 109, 0.4)";
                // Override the click function to shower love
                btn.onclick = showerLove;
            }
        }

        // --- LOVE SHOWER (RAIN) ---
        function showerLove() {
            document.getElementById('question-text').innerText = "YAYYY! I KNEW IT! 💋";
            document.getElementById('noBtn').style.display = 'none'; // Hide the duplicate button if clicked first
            
            const emojis = ['💋', '❤️', '🥰', '🌹', '😍', '✨'];
            
            for (let i = 0; i < 100; i++) {
                const drop = document.createElement('div');
                drop.classList.add('emoji-rain');
                drop.innerText = emojis[Math.floor(Math.random() * emojis.length)];
                
                drop.style.left = Math.random() * 100 + 'vw';
                drop.style.animationDuration = Math.random() * 2 + 2 + 's'; // Fall speed
                drop.style.fontSize = Math.random() * 20 + 20 + 'px';
                
                document.body.appendChild(drop);
                
                setTimeout(() => drop.remove(), 4000);
            }
            
            // Also trigger fireworks
            startFireworks();
        }

        // --- FIREWORKS ---
        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');
        let particles = [];
        function resizeCanvas() { canvas.width = window.innerWidth; canvas.height = window.innerHeight; }
        window.addEventListener('resize', resizeCanvas);
        resizeCanvas();

        function createFirework(x, y) {
            const colors = ['#ff4d6d', '#ff9a9e', '#ffd1ff', '#ffffff'];
            for (let i = 0; i < 30; i++) {
                particles.push({
                    x: x, y: y, color: colors[Math.floor(Math.random() * colors.length)],
                    radius: Math.random() * 3 + 1,
                    velocity: { x: (Math.random() - 0.5) * 6, y: (Math.random() - 0.5) * 6 },
                    life: 100, alpha: 1
                });
            }
        }

        function animate() {
            requestAnimationFrame(animate);
            ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear for rain effect visibility
            particles.forEach((p, index) => {
                if (p.life > 0) {
                    ctx.beginPath(); ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
                    ctx.fillStyle = p.color; ctx.globalAlpha = p.alpha; ctx.fill();
                    p.x += p.velocity.x; p.y += p.velocity.y; p.life--; p.alpha -= 0.01;
                } else { particles.splice(index, 1); }
            });
        }
        function startFireworks() {
            setInterval(() => { createFirework(Math.random() * canvas.width, Math.random() * canvas.height / 2); }, 800);
            animate();
        }
    </script>
</body>
</html>
