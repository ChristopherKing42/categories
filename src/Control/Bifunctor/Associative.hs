-- {-# OPTIONS -fglasgow-exts -fallow-undecidable-instances #-}
-------------------------------------------------------------------------------------------
-- |
-- Module	: Control.Bifunctor.Associative
-- Copyright 	: 2008 Edward Kmett
-- License	: BSD
--
-- Maintainer	: Edward Kmett <ekmett@gmail.com>
-- Stability	: experimental
-- Portability	: non-portable (class-associated types)
--
-- NB: this contradicts another common meaning for an 'Associative' 'Category', which is one 
-- where the pentagonal condition does not hold, but for which there is an identity.
--
-------------------------------------------------------------------------------------------
module Control.Bifunctor.Associative where

import Control.Bifunctor

{- | A category with an associative bifunctor satisfying Mac Lane\'s pentagonal coherence identity law:

> second associate . associate . first associate = associate . associate
-}
class Bifunctor p => Associative p where
	associate :: p (p a b) c -> p a (p b c)

{- | A category with a coassociative bifunctor satisyfing the dual of Mac Lane's pentagonal coherence identity law:

> first coassociate . coassociate . second coassociate = coassociate . coassociate
-}
class Bifunctor s => Coassociative s where
	coassociate :: s a (s b c) -> s (s a b) c

{-# RULES
	"copentagonal coherence"
		first coassociate . coassociate . second coassociate = coassociate . coassociate
	"pentagonal coherence"
		second associate . associate . first associate = associate . associate
 #-}