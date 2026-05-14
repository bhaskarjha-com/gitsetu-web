export const GET = async () => {
  try {
    // Use Vite's import.meta.glob to read all markdown files at build-time.
    const allDocs = import.meta.glob('./docs/**/*.md', { eager: true });
    
    const results = Object.keys(allDocs).map((path) => {
      const doc = allDocs[path] as any;
      
      // Convert relative file path to an absolute URL path.
      // e.g. './docs/getting-started/quickstart.md' -> '/docs/getting-started/quickstart'
      const url = path.replace('./docs/', '/docs/').replace('.md', '');
      
      return {
        title: doc.frontmatter?.title || url,
        description: doc.frontmatter?.description || '',
        url: url,
        content: typeof doc.rawContent === 'function' ? doc.rawContent() : ''
      };
    });

    return new Response(JSON.stringify(results), {
      status: 200,
      headers: {
        'Content-Type': 'application/json',
        // Cache strongly as the index won't change between builds
        'Cache-Control': 'public, max-age=31536000, immutable'
      },
    });
  } catch (error: any) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
}
