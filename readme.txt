MoneyMatters
============

MoneyMatters is a simple iPhone app that explores the behaviour of
the NSNumberFormatter class. Various values are formatted as currency
with several locales.

In particular, the rounding of values to the nearest 0.05 value for the
Swiss locale is interesting.

Yen is rounded to the nearest whole number too.

The NSFormatter NSLocale class provides the strings to be used in
the formatted currency value:

Currency Symbol
Grouping Separator
Decimal Separator

These are injected in the positions appropriate for the locale.
eg. Currency Symbol is sometimes at the beginning and sometimes
at the end of the formatted string.

Note that the Currency Symbol for Swiss Francs on iOS and the
simulator is CHF and on OSX is S.Fr

This app is distributed under the terms of the MIT License.
===========================================================
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.