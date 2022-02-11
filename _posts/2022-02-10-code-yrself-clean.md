---
layout: post
title: "code yrself clean (part 1)"
date: 2022-02-10 17:53:00 -0500
categories: praxis
tags: unsolicited-advice programming serial python
---
## TL;DR

- More functions
- Don't nest loops or conditionals
- Write in the style of the language

## yr functions do too much

A good sign that your code needs refactoring: too many deep structures in one
function:

- Nested for loops
- Two or more layers of conditionals (`if-if-else-elif-else`)
- Deep object references(`beware['of']['the']['blob]`)

Why's this bad? One more hint:

- `manual_array_indexing[0][1]`

What all these have in common is that we are making the scope do too much work. What's this condition do? What's that condition do? Why is the data we want buried in a dict in a list in a dict? We are carrying that context around in our skulls instead of documenting it, and by documenting it I mean making small distinct things in code and giving them useful names.

A well-written function should do one thing that is understandable from its name.

### return early, return often

"single entry / single exit" was thought a good idea a long ago when GOTOs were not entirely bad
yet, which is a long time ago.

```python
# this is hard
def fanout(thing):
    thing_say = ""
    if thing.id == 1:
        thing_say = "thing one!"
    elif thing == 2:
        thing_say = "thing two!"
    else
        thing_say = "guess i'm a cat?"
    return thing_say
```

This is hard to follow (or indent) and easy to break. Don't do that. Return from a function as soon as you're done.

 ```python
    def fanout_thing(thing: Thing) -> str:
        """Say what thing says.

        Notes:
        - PEP-255 specifies comment formatting
        - Type hinting is awesome. Specify types whenever you can, and do so
          in code rather than adding extra text in the docstring.
        """
        if thing.id == 1:
            # Refactor this later!
            return "thing one!"

        if thing.id == 2:
            return "thing two!"

        # Future lesson: don't be shy with logging
        LOGGER.info('%s is unhandled Thing', thing)
        return "guess i'm still a cat"

```

### What about loops?

Nested for-loops keep showing up in code, and once there, they are very hard to refactor out.

How do they get there? A few possible reasons:

CS101 courses tend to focus on control flow early. They never get to functions (kids code in one hour) or if they do, it's after spending too much time on loops.

CS teachers learned computing with earlier languages that did not have modern constructs like enumerated loops (for...in) and so they teach a modern language like it is C:

```python
for i in range(5):
    print(array[i])
```

More pernicious is the "accumulator antipattern", which is assigning an empty array and then doing something to it over a loop:

```python
boxes = []
for item in items:
    wrapped_item = wrap(item)
    boxes.append(wrapped_item)
return item
```

For Python, the salvation is to create a function limited to a single list/dict comprehension. What if you don't know what you're going to do on the inside of the loop, and want to make it repeatable?

The easiest way would be to use `yield` to make this loop a generator, so you can make that someone else's problem:

```python
def boxify(items)
    for item in items:
        yield item

boxed_items = [
    wrap(item)
    for item in boxify(items)
]
```

This is how you break mammoth nested loops into smaller reusable pieces:

- Use list (or dict) comprehensions when you want to put a loop inside a function
- Use generators (`yield`) when you want to put the loop outside a function

## Writing code with an accent

The other day, I saw a Python module that was nothing but a single class with nothing but static methods. I knew that whoever wrote this was writing Python like they wrote Java.

Consistency is at least as important as correctness. Don't be this guy: "Everybody else went to the wrong house for this party."

If you want to write good code in your language, write like a native.

- Write library code, and then write the bare minimum to invoke it. Even if you never reuse it, it's easier to test. More importantly, you've got your language's standard library (and hopefully package environment) to look through for examples
- Look through examples of code and find things that you like. Create a style. _Express your thoughts and beliefs through how you structure your code
- Look at the things adjacent to code, too. Look at what good documentation is like. Look at how packages build, how they test. Look at the github repo and find projects that are easy to clone and run without any hiccups

Think of who's going to maintain your code. Try to help them.

> It's all chaos, it's all random, and it's horrifying. And if you want to try and reduce the horror, and reduce the chaos, be kind. That's all you can do.
>
> It's chaos. Be kind.
>
> ---Patton Oswalt
