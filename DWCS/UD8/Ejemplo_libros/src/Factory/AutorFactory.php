<?php

namespace App\Factory;

use App\Entity\Autor;
use App\Repository\AutorRepository;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;
use Zenstruck\Foundry\RepositoryProxy;

/**
 * @extends ModelFactory<Autor>
 *
 * @method        Autor|Proxy                     create(array|callable $attributes = [])
 * @method static Autor|Proxy                     createOne(array $attributes = [])
 * @method static Autor|Proxy                     find(object|array|mixed $criteria)
 * @method static Autor|Proxy                     findOrCreate(array $attributes)
 * @method static Autor|Proxy                     first(string $sortedField = 'id')
 * @method static Autor|Proxy                     last(string $sortedField = 'id')
 * @method static Autor|Proxy                     random(array $attributes = [])
 * @method static Autor|Proxy                     randomOrCreate(array $attributes = [])
 * @method static AutorRepository|RepositoryProxy repository()
 * @method static Autor[]|Proxy[]                 all()
 * @method static Autor[]|Proxy[]                 createMany(int $number, array|callable $attributes = [])
 * @method static Autor[]|Proxy[]                 createSequence(iterable|callable $sequence)
 * @method static Autor[]|Proxy[]                 findBy(array $attributes)
 * @method static Autor[]|Proxy[]                 randomRange(int $min, int $max, array $attributes = [])
 * @method static Autor[]|Proxy[]                 randomSet(int $number, array $attributes = [])
 */
final class AutorFactory extends ModelFactory
{
    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#factories-as-services
     *
     * @todo inject services if required
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#model-factories
     *
     * @todo add your default values here
     */
    protected function getDefaults(): array
    {
        return [
            'nombre' => self::faker()->text(255),
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    protected function initialize(): self
    {
        return $this
            // ->afterInstantiate(function(Autor $autor): void {})
        ;
    }

    protected static function getClass(): string
    {
        return Autor::class;
    }
}
