local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--    General Notes
ls.add_snippets("markdown", {
  --    Obsidian LaTex Suite
  -- $$  $$
  s("mk", {
    t("$$\\Large "),
    i(1),
    t("$$"),
  }),
  -- Varios alineados
  s("mk-align", {
    t({ "$$", "\\Large", "\\begin{aligned}" }),
    t({ "", "\t\\;& " }),
    i(1, "Primera expresión"),
    t({ " \\\\[4pt]" }),
    t({ "", "\t\\;& " }),
    i(2, "Segunda expresión (final)"),
    t({ "", "\\end{aligned}", "$$" }),
  }),
  -- $$ \n $$
  s("dm", {
    t({ "$$\\Large", "" }), -- Primera línea con $$ y un salto de línea
    i(1), -- Nodo de inserción con un texto por defecto
    t({ "", "$$" }), -- Última línea con $$
  }),
  -- ^{2}
  s("exp2", {
    i(1),
    t("^{2}"),
  }),
  -- ^{3}
  s("exp3", {
    i(1),
    t("^{3}"),
  }),
  -- ^{}
  s("exp", {
    i(1),
    t("^{"),
    i(2),
    t("}"),
  }),
  -- _^{}
  s("sub", {
    i(1),
    t("_{"),
    i(2),
    t("}"),
  }),
  -- Division
  s("frac", {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
  }),
  -- \bar_{x} ---> promedio
  s("promedio", {
    t("\\bar{"),
    i(1),
    t("}"),
  }),
  -- \sqrt{} ---> Raiz
  s("raiz", {
    t("\\sqrt{"),
    i(1),
    t("}"),
  }),
  s("raizn", {
    t("\\sqrt["),
    i(1, "n"),
    t("]{"),
    i(2, "x"),
    t("}"),
  }),

  -- \int_{}^{} ----> integral Definida
  s("integralDef", {
    t("\\int_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
  }),
  -- \int ---> integral
  s("integralIndef", {
    t("\\int"),
  }),
  -- \text ---> texto
  s("text", {
    t("\\text{"),
    i(1),
    t("}"),
  }),
  -- \quadd ---> Espacio Grande
  s("spaceBig", {
    t("\\qquad"),
  }),
  -- \space ---> Espacio normal
  s("space", {
    t("\\space"),
  }),
  -- Parenthesis/brackets
  s("Parenthesis", {
    t("\\left( "),
    i(1),
    t(" \\right) "),
  }),
  s("brackets", {
    t("\\left[ "),
    i(1),
    t(" \\right] "),
  }),
  -- \cdot ---> multiplicacion
  s("dot", {
    t("\\cdot"),
  }),
  -- Logaritmos
  -- Sin base
  s("log", {
    t("\\log{"),
    i(1, "x"),
    t("}"),
  }),
  -- Con base
  s("logb", {
    t("\\log_{"),
    i(1, "a"),
    t("}{"),
    i(2, "x"),
    t("}"),
  }),
  -- Mas menos
  s("masmenos", {
    t("\\pm"),
  }),
  -- Exponencial de euler
  s("exp_euler", {
    t("e^{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Log Natural
  s("ln", {
    t("\\ln{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Identidades trigonometricas
  -- Seno
  s("sen", {
    t("\\sin{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Coseno
  s("cos", {
    t("\\cos{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Tangente
  s("tan", {
    t("\\tan{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Cotangente
  s("cot", {
    t("\\cot{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Secante
  s("sec", {
    t("\\sec{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Cosecante
  s("csc", {
    t("\\csc{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Arco seno
  s("arcsen", {
    t("\\arcsin{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Arco coseno
  s("arccos", {
    t("\\arccos{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Arco tangente
  s("arctan", {
    t("\\arctan{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Grados
  s("grados", {
    i(1, "90"),
    t("^{\\circ}"),
    i(0),
  }),
  -- Alfa
  s("alpha", {
    t("\\alpha"),
    i(0),
  }),

  -- Theta
  s("theta", {
    t("\\theta"),
    i(0),
  }),

  -- Gamma
  s("gamma", {
    t("\\gamma"),
    i(0),
  }),

  -- Beta
  s("beta", {
    t("\\beta"),
    i(0),
  }),

  -- Delta
  s("delta", {
    t("\\delta"),
    i(0),
  }),

  -- Pi
  s("pi", {
    t("\\pi"),
    i(0),
  }),

  -- Sigma
  s("sigma", {
    t("\\sigma"),
    i(0),
  }),

  -- Omega
  s("omega", {
    t("\\omega"),
    i(0),
  }),
  -- Composiscion
  s("comp", {
    i(1, "f"),
    t(" \\circ "),
    i(2, "g"),
    i(0),
  }),
  -- Limite general
  s("lim", {
    t("\\lim_{x \\to "),
    i(1, "a"),
    t("} "),
    i(2, "f(x)"),
    i(0),
  }),
  -- Limite derecha +
  s("limd", {
    t("\\lim_{x \\to "),
    i(1, "a"),
    t("^{+}} "),
    i(2, "f(x)"),
    i(0),
  }),
  -- Limite izquierda -
  s("limi", {
    t("\\lim_{x \\to "),
    i(1, "a"),
    t("^{-}} "),
    i(2, "f(x)"),
    i(0),
  }),
  -- Inifito
  s("infinito", {
    t("\\infty"),
    i(0),
  }),
  -- Conjunto de numeros Reales (Condicion)
  s("rcond", {
    t("x \\in \\mathbb{R} \\mid "),
    i(1, "x > 0"),
    i(0),
  }),
  -- Conjunto de numeros Reales (sin Condicion)
  s("rset", {
    t("x \\in \\mathbb{R}"),
    i(0),
  }),
  -- Se cancela y es 0
  s("cancelar", {
    t("\\cancel{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  s("cancelar-a", {
    t("\\cancelto{0}{"),
    i(1, "x"),
    t("}"),
    i(0),
  }),
  -- Funciones a trozos
  s("trozos", {
    t("f(x)="),
    t({ "\\begin{cases}" }),
    t({ "", "  " }),
    i(1, "x^2"),
    t(", & "),
    i(2, "x \\geq 0"),
    t({ " \\\\[6pt]" }),
    t({ "", "  " }),
    i(3, "-x"),
    t(", & "),
    i(4, "x < 0"),
    t({ "", "\\end{cases}" }),
    i(0),
  }),
  -- Matriz 3x3 con paréntesis
  s("matp3", {
    t("\\begin{pmatrix}"),
    t({ "", "\t" }),
    i(1, "a_{11}"),
    t(" & "),
    i(2, "a_{12}"),
    t(" & "),
    i(3, "a_{13} \\\\"),
    t({ "", "\t" }),
    i(4, "a_{21}"),
    t(" & "),
    i(5, "a_{22}"),
    t(" & "),
    i(6, "a_{23} \\\\"),
    t({ "", "\t" }),
    i(7, "a_{31}"),
    t(" & "),
    i(8, "a_{32}"),
    t(" & "),
    i(9, "a_{33}"),
    t({ "", "\\end{pmatrix}" }),
  }),
  -- Matriz 4x4 con paréntesis
  s("matp4", {
    t("\\begin{pmatrix}"),
    t({ "", "\t" }),
    i(1, "a_{11}"),
    t(" & "),
    i(2, "a_{12}"),
    t(" & "),
    i(3, "a_{13}"),
    t(" & "),
    i(4, "a_{14} \\\\"),
    t({ "", "\t" }),
    i(5, "a_{21}"),
    t(" & "),
    i(6, "a_{22}"),
    t(" & "),
    i(7, "a_{23}"),
    t(" & "),
    i(8, "a_{24} \\\\"),
    t({ "", "\t" }),
    i(9, "a_{31}"),
    t(" & "),
    i(10, "a_{32}"),
    t(" & "),
    i(11, "a_{33}"),
    t(" & "),
    i(12, "a_{34} \\\\"),
    t({ "", "\t" }),
    i(13, "a_{41}"),
    t(" & "),
    i(14, "a_{42}"),
    t(" & "),
    i(15, "a_{43}"),
    t(" & "),
    i(16, "a_{44}"),
    t({ "", "\\end{pmatrix}" }),
  }),
  -- Matriz 4x4 con paréntesis (sin índices)
  s("matp4s", {
    t("\\begin{pmatrix}"),
    t({ "", "\t" }),
    i(1, "a"),
    t(" & "),
    i(2, "b"),
    t(" & "),
    i(3, "c"),
    t(" & "),
    i(4, "d \\\\"),
    t({ "", "\t" }),
    i(5, "e"),
    t(" & "),
    i(6, "f"),
    t(" & "),
    i(7, "g"),
    t(" & "),
    i(8, "h \\\\"),
    t({ "", "\t" }),
    i(9, "i"),
    t(" & "),
    i(10, "j"),
    t(" & "),
    i(11, "k"),
    t(" & "),
    i(12, "l \\\\"),
    t({ "", "\t" }),
    i(13, "m"),
    t(" & "),
    i(14, "n"),
    t(" & "),
    i(15, "o"),
    t(" & "),
    i(16, "p"),
    t({ "", "\\end{pmatrix}" }),
  }),
  -- Array 3x3 sin bordes exteriores
  s("array3", {
    t("\\begin{array}{c|c|c}"),
    t({ "", "\t" }),
    i(1, "a_{11}"),
    t(" & "),
    i(2, "a_{12}"),
    t(" & "),
    i(3, "a_{13} \\\\"),
    t("\t\\hline"),
    t({ "", "\t" }),
    i(4, "a_{21}"),
    t(" & "),
    i(5, "a_{22}"),
    t(" & "),
    i(6, "a_{23} \\\\"),
    t("\t\\hline"),
    t({ "", "\t" }),
    i(7, "a_{31}"),
    t(" & "),
    i(8, "a_{32}"),
    t(" & "),
    i(9, "a_{33}"),
    t({ "", "\\end{array}" }),
  }),
  -- Matriz aumentada 3x3 para Gauss–Jordan
  s("matAum", {
    t("\\left( \\begin{array}{ccc|ccc}"),
    t({ "", "\t" }),
    i(1, "a_{11}"),
    t(" & "),
    i(2, "a_{12}"),
    t(" & "),
    i(3, "a_{13}"),
    t(" & "),
    i(4, "1"),
    t(" & "),
    i(5, "0"),
    t(" & "),
    i(6, "0 \\\\"),
    t({ "", "\t" }),
    i(7, "a_{21}"),
    t(" & "),
    i(8, "a_{22}"),
    t(" & "),
    i(9, "a_{23}"),
    t(" & "),
    i(10, "0"),
    t(" & "),
    i(11, "1"),
    t(" & "),
    i(12, "0 \\\\"),
    t({ "", "\t" }),
    i(13, "a_{31}"),
    t(" & "),
    i(14, "a_{32}"),
    t(" & "),
    i(15, "a_{33}"),
    t(" & "),
    i(16, "0"),
    t(" & "),
    i(17, "0"),
    t(" & "),
    i(18, "1"),
    t({ "", "\\end{array} \\right)" }),
  }),
})
