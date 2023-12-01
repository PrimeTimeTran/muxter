export default function (api) {
  api.cache(true)
  const presets = [
    [
      '@babel/preset-env',
      {
        loose: true,
        targets: { node: 16 },
        modules: 'commonjs',
      },
    ],
  ]
  const ignore = ['./src/tooltip.js']
  const plugins = [
    '@babel/plugin-syntax-dynamic-import',
    [
      '@babel/plugin-transform-modules-commonjs',
      {
        allowTopLevelThis: true,
      },
    ],
  ]
  return { presets, ignore, plugins }
}
