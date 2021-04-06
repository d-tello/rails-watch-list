module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      'primary': '#a30316',
      'light': '#FBFBFD',
      'extra': '#ffba08',
      'secondary': '#00cc99',
      'dark': '#070600',
      'white': '#FFFFFF',
      'mark': '#ECE9F2',
      'gray': '#6C7381'
    },
    container: {
      center: true,
      padding: {
        DEFAULT: '1rem',
        sm: '2rem',
        lg: '4rem',
        xl: '5rem',
        '2xl': '6rem',
      },
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
  corePlugins: {
    fontFamily: false,
  },
}
