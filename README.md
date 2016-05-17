# elm dom diff

> Trying to understand some Elm virtual dom stuff

## Install

```bash
git clone git@github.com:pauldijou/elm-dom-diff.git
cd elm-dom-diff
./build
```

Then open `index.html` in your favorite browser.

When opening the first and third items, it will update the `class` attribute and add text inside it with a nice CSS transition. When opening the second item, it will remove the node and create a new one. You can check the console to see the mutation events.

So what's the difference? Nearly none... All items follow the same rules except the **first** is declared directly inside `Main.elm` while the others resides in their own module following the Elm architecture. The difference between **second** and **third** is that **second** uses `Html.App.map` inside `Maybe.withDefault` while the other is doing the inverse.
