---
title: "Python Patterns & Best Practices"
lang: en
domain: python
tags: [patterns, best_practices, python]
level: advanced
last_updated: 2025-08-16
---

# Python Patterns & Best Practices

## 1. Singleton Pattern
```python
class SingletonMeta(type):
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class Logger(metaclass=SingletonMeta):
    def log(self, msg):
        print(msg)
class Shape:
    def draw(self):
        pass

class Circle(Shape):
    def draw(self):
        print("Drawing Circle")

class Square(Shape):
    def draw(self):
        print("Drawing Square")

class ShapeFactory:
    @staticmethod
    def create_shape(type: str) -> Shape:
        if type == "circle":
            return Circle()
        elif type == "square":
            return Square()
        else:
            raise ValueError("Unknown shape type")
class Subject:
    def __init__(self):
        self._observers = []

    def register(self, observer):
        self._observers.append(observer)

    def notify(self, message):
        for obs in self._observers:
            obs.update(message)

class Observer:
    def update(self, message):
        print(f"Received: {message}")
class ManagedFile:
    def __init__(self, filename):
        self.filename = filename

    def __enter__(self):
        self.file = open(self.filename, 'w')
        return self.file

    def __exit__(self, exc_type, exc_value, traceback):
        self.file.close()
def decorator(func):
    def wrapper(*args, **kwargs):
        print("Before call")
        result = func(*args, **kwargs)
        print("After call")
        return result
    return wrapper

@decorator
def say_hello(name):
    print(f"Hello, {name}")
class StrategyExample:
    def __init__(self, func):
        self.execute = func

def strategy1():
    print("Executing Strategy 1")

def strategy2():
    print("Executing Strategy 2")

s = StrategyExample(strategy1)
s.execute()
class OldPrinter:
    def print_old(self):
        print("Old Print")

class NewPrinter:
    def print_new(self):
        print("New Print")

class Adapter:
    def __init__(self, obj, method):
        self.obj = obj
        self.method = method

    def print(self):
        getattr(self.obj, self.method)()
class RealService:
    def run(self):
        print("Running Real Service")

class ProxyService:
    def __init__(self):
        self.service = RealService()
    def run(self):
        print("Checking Access")
        self.service.run()
class Product:
    def __init__(self):
        self.parts = []
    def add(self, part):
        self.parts.append(part)

class Builder:
    def __init__(self):
        self.product = Product()
    def build_part(self, part):
        self.product.add(part)
    def get_product(self):
        return self.product
class MyIterator:
    def __init__(self, collection):
        self.collection = collection
        self.index = 0
    def __iter__(self):
        return self
    def __next__(self):
        if self.index < len(self.collection):
            result = self.collection[self.index]
            self.index += 1
            return result
        raise StopIteration

for i in MyIterator([1,2,3]):
    print(i)
class AbstractClass:
    def template_method(self):
        self.step1()
        self.step2()
    def step1(self):
        raise NotImplementedError
    def step2(self):
        raise NotImplementedError

class ConcreteClass(AbstractClass):
    def step1(self):
        print("Step1 completed")
    def step2(self):
        print("Step2 completed")

obj = ConcreteClass()
obj.template_method()

