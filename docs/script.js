// Midnight Moss Theme - Interactive Features

document.addEventListener('DOMContentLoaded', () => {
    initColorPalette();
    initSmoothScroll();
    initScrollAnimations();
});

/**
 * Color Palette Copy to Clipboard
 */
function initColorPalette() {
    const colorCards = document.querySelectorAll('.color-card');

    colorCards.forEach(card => {
        card.addEventListener('click', async () => {
            const colorCode = card.getAttribute('data-color');
            const colorName = card.querySelector('.color-name').textContent;

            try {
                await navigator.clipboard.writeText(colorCode);
                showCopyFeedback(card, colorName);
            } catch (err) {
                // Fallback for older browsers
                fallbackCopyTextToClipboard(colorCode);
                showCopyFeedback(card, colorName);
            }
        });
    });
}

/**
 * Show visual feedback when color is copied
 */
function showCopyFeedback(card, colorName) {
    // Add copied class for animation
    card.classList.add('copied');

    // Create and show tooltip
    const tooltip = document.createElement('div');
    tooltip.className = 'copy-tooltip';
    tooltip.textContent = `${colorName} copied!`;
    tooltip.style.cssText = `
        position: absolute;
        top: -40px;
        left: 50%;
        transform: translateX(-50%);
        background: #5e8d87;
        color: #1c1c1c;
        padding: 0.5rem 1rem;
        border-radius: 6px;
        font-size: 0.9rem;
        font-weight: 600;
        white-space: nowrap;
        pointer-events: none;
        z-index: 1000;
        animation: tooltip-fade 2s ease forwards;
    `;

    // Position card relatively for tooltip
    card.style.position = 'relative';
    card.appendChild(tooltip);

    // Remove after animation
    setTimeout(() => {
        card.classList.remove('copied');
        tooltip.remove();
    }, 2000);
}

/**
 * Fallback copy method for older browsers
 */
function fallbackCopyTextToClipboard(text) {
    const textArea = document.createElement('textarea');
    textArea.value = text;
    textArea.style.position = 'fixed';
    textArea.style.top = '0';
    textArea.style.left = '0';
    textArea.style.opacity = '0';
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();

    try {
        document.execCommand('copy');
    } catch (err) {
        console.error('Fallback: Unable to copy', err);
    }

    document.body.removeChild(textArea);
}

/**
 * Smooth scrolling for anchor links
 */
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');

            // Only prevent default for actual anchors, not just "#"
            if (href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);

                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });
}

/**
 * Scroll-based animations for elements
 */
function initScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observe feature cards
    document.querySelectorAll('.feature-card').forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = `all 0.6s ease ${index * 0.1}s`;
        observer.observe(card);
    });

    // Observe app categories
    document.querySelectorAll('.app-category').forEach((category, index) => {
        category.style.opacity = '0';
        category.style.transform = 'translateY(30px)';
        category.style.transition = `all 0.6s ease ${index * 0.1}s`;
        observer.observe(category);
    });

    // Observe install methods
    document.querySelectorAll('.install-method').forEach((method, index) => {
        method.style.opacity = '0';
        method.style.transform = 'translateY(30px)';
        method.style.transition = `all 0.6s ease ${index * 0.15}s`;
        observer.observe(method);
    });
}

/**
 * Add CSS for tooltip animation
 */
const style = document.createElement('style');
style.textContent = `
    @keyframes tooltip-fade {
        0% {
            opacity: 0;
            transform: translateX(-50%) translateY(10px);
        }
        20% {
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
        80% {
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
        100% {
            opacity: 0;
            transform: translateX(-50%) translateY(-10px);
        }
    }
`;
document.head.appendChild(style);
