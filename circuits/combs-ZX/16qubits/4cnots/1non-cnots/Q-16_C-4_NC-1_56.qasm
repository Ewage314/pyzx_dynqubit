OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[8];
z q[4];
cx q[15], q[3];
cx q[11], q[13];
cx q[2], q[0];
