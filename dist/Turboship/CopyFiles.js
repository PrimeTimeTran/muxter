import fs from 'fs';
import path from 'path';
var filesOrDirectories = ['../../../assets/css/main.css', '../../../assets/images', '../../../components/Admin/Aside.vue', '../../../components/Admin/Form/Field.vue', '../../../components/Admin/Form/Pagination.vue', '../../../components/The/Navbar', '../../../composables/useAPI.ts', '../../../composables/useToast.ts', '../../../composables/useToggleOpen.ts', '../../../layouts/AdminLayout.vue', '../../../layouts/default.vue', '../../../plugins/fontawesome.ts', '../../../server/middleware/01.auth.global.ts', '../../../server/middleware/02.user.global.ts', '../../../server/middleware/03.pagination.global.ts', '../../../utils/Colors.ts', '../../../utils/NavItems.ts', '../../../utils/QueryStrings.ts', '../../../app.vue', '../../../package.json', '../../../tailwind.config.js'];
function copyToNuxtTmp() {
  var currentFilePath = new URL(import.meta.url).pathname;
  var currentDirectory = path.dirname(currentFilePath);
  var baseDestination = path.resolve(currentDirectory, '../../../server/utils/Turboship/nuxt/');
  filesOrDirectories.forEach(function (fileOrDirectory) {
    var source = path.resolve(currentDirectory, fileOrDirectory);
    var destination = path.resolve(baseDestination, './utils/Turboship/nuxt', fileOrDirectory);
    if (fs.existsSync(source)) {
      if (fs.lstatSync(source).isDirectory()) {
        copyDirectory(source, destination);
      } else {
        var destinationDir = path.dirname(destination);
        if (!fs.existsSync(destinationDir)) {
          fs.mkdirSync(destinationDir, {
            recursive: true
          });
        }
        fs.copyFileSync(source, destination);
      }
    } else {
      console.error("Source ".concat(fileOrDirectory, " does not exist."));
    }
  });
  console.log('Files copied to Nuxt tmp directory.');
}
function copyDirectory(source, destination) {
  if (!fs.existsSync(destination)) {
    fs.mkdirSync(destination, {
      recursive: true
    });
  }
  var files = fs.readdirSync(source);
  files.forEach(function (file) {
    var currentSource = path.join(source, file);
    var currentDestination = path.join(destination, file);
    if (fs.lstatSync(currentSource).isDirectory()) {
      copyDirectory(currentSource, currentDestination);
    } else {
      var destinationDir = path.dirname(currentDestination);
      if (!fs.existsSync(destinationDir)) {
        fs.mkdirSync(destinationDir, {
          recursive: true
        });
      }
      fs.copyFileSync(currentSource, currentDestination);
    }
  });
}
copyToNuxtTmp();