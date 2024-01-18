using ForwardDiff


f(x::Real) = sin(x) + x

x = vcat(pi/4, 2:4)

# ℜ → ℜ
f(x::Real) = sin(x) #::Real
f′(f::Function) = x -> ForwardDiff.derivative(f, x) #::Real
f′′(f::Function) = x -> ForwardDiff.derivative(y -> ForwardDiff.derivative(f, y), x) #::Real

f(5)
f′(f)(5)
f′′(f)(5)

# ℜ^{n} → ℜ
f(x::Vector) = sin(x[1]) + prod(x[2:end])
∇f(f::Function) = x -> ForwardDiff.gradient(f, x)
Hf(f::Function) = x -> ForwardDiff.hessian(f, x)

f([pi/4, 2, 3, 4])
∇f(f)([pi/4, 2, 3, 4])
Hf(f)([pi/4, 2, 3, 4])

# ℜ^{n} → ℜ^{m}
f(x::Vector) = [sin(x[1]), cos(x[2]), tan(x[3])]
Jf(f::Function) = x -> ForwardDiff.jacobian(f, x)
vector_Hf(f::Function) = x -> ForwardDiff.jacobian(y -> ForwardDiff.jacobian(f, y), x)

f([pi/4, 2, 3, 4])
Jf(f)([pi/4, 2, 3, 4])
vector_Hf(f)([pi/4, 2, 3, 4])
