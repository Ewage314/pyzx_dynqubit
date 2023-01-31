OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[3];
cx q[4], q[3];
cx q[6], q[2];
z q[0];
cx q[5], q[6];
cx q[4], q[1];
