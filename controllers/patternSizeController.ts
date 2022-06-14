import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/:patternid', async (req, res) => {
    const { patternid } = req.params;
    const patternSizes = await prisma.patternsize.findMany({
        include: {
            size: true,
        },
        where: {
            patternid: Number(patternid),
        },
    });
    res.json(patternSizes);
});

router.post('/', async (req, res) => {
    const { patternid, sizeid, yards } = req.body;
    try {
        const result = await prisma.patternsize.create({
            data: {
                patternid,
                sizeid,
                yards,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        console.error(err);
        res.status(400).json({ message: 'Something went wrong' });
    }
});

export default router;
