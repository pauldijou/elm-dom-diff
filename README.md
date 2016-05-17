# elm dom diff

> Trying to understand some Elm virtual dom stuff

## Install

```bash
git clone git@github.com:pauldijou/elm-dom-diff.git
cd elm-dom-diff
./build
```

Then open `index.html` in your favorite browser.

When opening the first item, it will update the `class` attribute and add text inside it. When open the second item, it will remove the node and create a new one. You can check the console to see the mutation events.

So what's the difference? Nearly none... Both items follow the same rules except one is declared directly inside `Main.elm` while the other resides in its own module following the Elm architecture.
