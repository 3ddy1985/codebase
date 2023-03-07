const fetch = require('node-fetch');

async function getSelectedLanguages(userId) {
  const response = await fetch(`/users/${userId}/languages`);
  if (response.ok) {
    const languages = await response.json();
    return languages;
  } else {
    throw new Error(`Failed to get languages for user ${userId}`);
  }
}



const inputFiles = glob.sync('app/javascript/**/*.js');

esbuild.build({
  entryPoints: inputFiles,
  outfile: 'app/assets/builds/application.js',
  bundle: true,
  sourcemap: true,
  watch: true,
});
