import { Resvg } from '@resvg/resvg-js';
import satori from 'satori';
import { html } from 'satori-html';

const pages = import.meta.glob('/src/pages/docs/**/*.md', { eager: true });

export async function getStaticPaths() {
  const paths = Object.keys(pages).map((path) => {
    // path: /src/pages/docs/enterprise/security-privacy.md
    // We want to extract "docs/enterprise/security-privacy"
    const slug = path.replace('/src/pages/', '').replace('.md', '');
    return {
      params: { slug },
      props: { page: pages[path] },
    };
  });
  return paths;
}

export const GET = async ({ params, props }) => {
  const { page } = props;
  const title = (page as any).frontmatter.title || 'GitSetu Documentation';
  const description = (page as any).frontmatter.description || 'Zero-Trust Identity Security platform';

  // We fetch a highly legible Google Font to embed in the SVG.
  // Using Inter 700 (Bold) for maximum impact on social feeds.
  const fontFile = await fetch(
    'https://og-playground.vercel.app/inter-latin-ext-700-normal.woff'
  );
  const fontData: ArrayBuffer = await fontFile.arrayBuffer();

  const markup = html`
    <div style="display: flex; flex-direction: column; justify-content: center; width: 100%; height: 100%; background-color: #000000; color: #ffffff; padding: 60px; font-family: 'Inter';">
      <div style="display: flex; flex-direction: column; width: 100%; height: 100%; border: 1px solid rgba(255, 255, 255, 0.15); border-radius: 24px; padding: 60px; background: #0a0a0a; position: relative;">
        
        <div style="display: flex; align-items: center; margin-bottom: 40px;">
          <div style="display: flex; background-color: #ffffff; color: #000000; padding: 8px 16px; border-radius: 8px; font-weight: bold; font-size: 28px;">
            gitsetu — bash
          </div>
          <div style="display: flex; margin-left: 20px; font-size: 28px; color: rgba(255,255,255,0.6);">
            Enterprise Security
          </div>
        </div>
        
        <h1 style="font-size: 80px; font-weight: 700; margin: 0 0 20px 0; line-height: 1.1; display: flex; color: #ffffff;">
          ${title}
        </h1>
        
        <p style="font-size: 36px; color: rgba(255, 255, 255, 0.7); margin: 0; line-height: 1.4; display: flex; max-width: 900px;">
          ${description}
        </p>

        <div style="display: flex; position: absolute; bottom: 60px; left: 60px; align-items: center;">
          <span style="display: flex; width: 20px; height: 20px; border-radius: 50%; background-color: #00e5ff; margin-right: 16px;"></span>
          <span style="display: flex; font-size: 32px; color: #00e5ff;">gitsetu.bhaskarjha.dev</span>
        </div>
      </div>
    </div>
  `;

  const svg = await satori(markup, {
    width: 1200,
    height: 630,
    fonts: [
      {
        name: 'Inter',
        data: fontData,
        weight: 700,
        style: 'normal',
      },
    ],
  });

  const resvg = new Resvg(svg, {
    fitTo: {
      mode: 'width',
      value: 1200,
    },
  });
  
  const image = resvg.render();

  return new Response(image.asPng(), {
    headers: {
      'Content-Type': 'image/png',
      'Cache-Control': 'public, max-age=31536000, immutable',
    },
  });
};
